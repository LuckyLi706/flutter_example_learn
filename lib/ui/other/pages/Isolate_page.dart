import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/platform/platform_diff.dart';
import 'package:flutter_example_learn/util/platform_util.dart';
import 'package:flutter_example_learn/util/toast_util.dart';
import 'package:path_provider/path_provider.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/14 17:59
/// @Description  多线程
/// 针对Web端，Web不支持Isolate，Web使用Worker
/// 针对非Web端，使用Isolate
/// 需要针对不同平台区分对待
/// https://pub.dev/packages/isolated_worker 可以使用这个库
class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() {
    return _IsolatePageState();
  }
}

class _IsolatePageState extends BasePageState<IsolatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _controller.forward();
  }

  @override
  Widget initWidget() {
    if (PlatformUtil.isWeb()) {
      return const Center(
        child: Text('Web端不支持Isolate，Web端需要使用Worker类来支持，没研究'),
      );
    }
    return Column(
      children: [
        CommonButton('默认模式', () async {
          defaultType().then((value) {
            ToastUtil.showToast('获取数据成功：$value');
          });
        }),

        ///todo 待研究
        ///dio下载文件并不会影响ui绘制
        ///dio依赖于dart的HttpClient库、
        ///HttpClient底层是否做了处理
        CommonButton('文件下载测试', () async {
          Directory dir = await getTemporaryDirectory();
          File file = File('${dir.path}\\SogouInput_11.28_android_sweb.apk');
          Dio dio = Dio();
          print('下载地址：${file.path}');
          dio.download(
              'https://apkdl.sogouimecdn.com/wapdl/android/apk/SogouInput_11.28_android_sweb.apk',
              file.path, onReceiveProgress: (count, total) {
            print('count:${count},total:${total}');
          });
        }),
        CommonButton('compute', () async {
          ///root isolate传给后台isolate标志
          ///(API开始从Flutter3.7)
          ///这样后台isolate通道就可以使用平台通道和第三方库了
          ///https://juejin.cn/post/7194051289238470712
          RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

          ///这个是flutter封装的库，针对输出和输入一对一模式的
          int result = await compute(testCompute, [
            rootIsolateToken,
            (message) async {
              await ToastUtil.showToast(message);
            }
          ]);
          ToastUtil.showToast('返回结果:$result');
        }),
        CommonButton('Sync Isolate', () async {
          dynamic result = await createSyncIsolate();
          ToastUtil.showToast('返回数据：${result.toString()}');
        }),
        CommonButton('CallBack Isolate', () async {
          _createCallbackIsolate((message) {
            ToastUtil.showToast(message);
          });
        }),
        const CommonText('多输入输出Isolate'),
        CommonButton('More Input Output Isolate init', () async {
          RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
          await _createMoreInputOrOutputIsolate(rootIsolateToken);
          ToastUtil.showToast('初始化完成');
        }),
        CommonButton('send message', () async {
          if (subSendPort == null) {
            ToastUtil.showToast('请先初始化');
          } else {
            sendMessage++;
            subSendPort?.send(sendMessage);
          }
        }),
        SizedBox(
          height: 100,
          child: RotationTransition(
            turns: _controller
              ..addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  _controller.reset();
                  _controller.forward();
                }
              }),
            child: const Text('我是个旋转动画'),
          ),
        )
      ],
    );
  }

  int sendMessage = 0;

  @override
  String appBarTitle() {
    return S.of(context).multi_thread;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    kill();
  }
}

PlatformDiff platformDiff = PlatformDiff();

Future<int> defaultType() {
  sleep(const Duration(seconds: 5));
  return Future(() => 1);
}

///todo pc端没有比较好的方案去展示吐司，都涉及到widget，widget在Isolate调用都会报错报错，待研究
Future<int> testCompute(List<dynamic> list) async {
  /// 将后台isolate注册为root isolate,下面就可以使用第三方库
  /// 3.7的新特性
  /// https://juejin.cn/post/7194051289238470712
  BackgroundIsolateBinaryMessenger.ensureInitialized(list.first);
  Function(String message) onSuccess = list[1];

  await getApplicationCacheDirectory();
  if (PlatformUtil.isMobile()) {
    ToastUtil.showToast('模拟5秒耗时');
  }

  ///模拟耗时
  sleep(const Duration(seconds: 3));

  ///对于这些弹窗或者第三方库必须使用await，不然结果返回了，当前Isolate就会被销毁掉，会导致crash
  ///https://github.com/flutter/flutter/issues/122882
  if (PlatformUtil.isMobile()) {
    await onSuccess('获取数据成功啦');
  }

  await Future.delayed(const Duration(seconds: 2));
  return 1;
}

void kill() {
  isolate?.kill(priority: Isolate.immediate);
  isolate = null;
}

Isolate? isolate;

///同步返回结果，只返回一次结果
Future<dynamic> createSyncIsolate() async {
  ReceivePort receivePort = ReceivePort();

  ///主Isolate的发送器
  SendPort sendPort = receivePort.sendPort;
  isolate = await Isolate.spawn(testIsolateSync, [sendPort]);
  return await receivePort.first;
}

///通过exit和send方法返回数据的区别
///https://juejin.cn/post/7049990302739726366
void testIsolateSync(List<dynamic> list) {
  SendPort sendPort = list.first;

  ///模拟延迟
  sleep(const Duration(seconds: 5));

  Isolate.exit(sendPort, 1);
}

///回调的方式多次返回结果
void _createCallbackIsolate(Function(String message) onMessage) async {
  ReceivePort receivePort = ReceivePort();

  ///主Isolate的发送器
  SendPort sendPort = receivePort.sendPort;
  isolate = await Isolate.spawn(_testCallbackIsolateSync, [sendPort]);
  receivePort.listen((message) {
    ///回调结果
    onMessage(message);
  });
}

void _testCallbackIsolateSync(List<dynamic> list) {
  SendPort sendPort = list.first;

  ///模拟延迟
  sleep(const Duration(seconds: 5));
  sendPort.send('第一次的结果');
  sleep(const Duration(seconds: 5));
  sendPort.send('第二次的结果');
  sleep(const Duration(seconds: 5));
  sendPort.send('第三次的结果');
}

///子Isolate的发送器，使用这个向子Isolate发送消息
SendPort? subSendPort;

///多输入输出，子Isolate，异常抛出，
Future _createMoreInputOrOutputIsolate(
    RootIsolateToken rootIsolateToken) async {
  ReceivePort receivePort = ReceivePort();

  ///主Isolate的发送器
  SendPort sendPort = receivePort.sendPort;
  isolate = await Isolate.spawn(
      _testMoreInputOrOutputIsolateSync, [sendPort, rootIsolateToken],
      onError: receivePort.sendPort, onExit: receivePort.sendPort);
  receivePort.listen((message) {
    ///回调结果
    if (message is SendPort) {
      subSendPort = message;
    } else {
      ToastUtil.showToast('主Isolate接收到了消息,消息是$message');
    }
  });
}

///子Isolate需要使用第三方库，需要与主Isolate建立
///https://juejin.cn/post/7194051289238470712
void _testMoreInputOrOutputIsolateSync(List<dynamic> list) {
  platformDiff.backgroundIsolateInit(list[1]);

  ReceivePort receivePort = ReceivePort();

  ///子Isolate的发送器
  SendPort subSendPort = receivePort.sendPort;

  ///主Isolate的发送器
  SendPort sendPort = list.first;
  sendPort.send(subSendPort);
  try {
    // testException();

    receivePort.listen(
      (message) {
        ///接受消息
        if (PlatformUtil.isMobile()) {
          ToastUtil.showToast('子Isolate接收到了消息,消息是$message，我过五秒给你发消息');
        }
        sleep(const Duration(seconds: 5));
        sendPort.send(message);
      },
    );
  } catch (e) {
    sendPort.send(e.toString());
  }
}

testException() {
  sleep(const Duration(seconds: 2));
  throw Exception('我是故意的异常');
}
