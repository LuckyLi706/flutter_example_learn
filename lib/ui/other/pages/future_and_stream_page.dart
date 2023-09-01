import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/29 17:06
/// @Description Future和Stream
/// Dart中也有一个无线循环的事件循环，包含两个队列: microtask队列和event队列。Dart会不断地循环访问这两个队列，
/// 从中取出任务来执行。microtask队列的优先级高于event队列，如果microtask队列不为空，就从中取出任务执行。
/// 当microtask队列为空时，才会访问event队列。
/// 通过scheduleMicrotask方法可以向microtask队列中添加任务，而UI事件、Timer等操作和Future的默认构造方法都是添加到event队列中。
/// Future中可以Future.microtask来向microtask队列添加任务
class FutureStreamPage extends StatefulWidget {
  const FutureStreamPage({super.key});

  @override
  State<FutureStreamPage> createState() {
    return _FutureStreamPageState();
  }
}

class _FutureStreamPageState extends BasePageState<FutureStreamPage> {
  @override
  Widget initWidget() {
    return SizedBox(
      height: ScreenUtil.screenHeight(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CommonText('Future'),
            CommonButton(S.of(context).base_future, () {
              _baseFuture();
            }),
            CommonButton(S.of(context).exception_future, () {
              _futureException();
            }),
            CommonButton(S.of(context).advanced_future, () {
              _advancedFuture();
            }),
            CommonButton(S.of(context).micro_task_queue, () {
              _microTaskFuture();
            }),
            const CommonText('Stream'),
            CommonButton('', () {
              _baseStream();
            }),
          ],
        ),
      ),
    );
  }

  @override
  String appBarTitle() {
    return 'Future和Stream';
  }

  void _baseFuture() {
    ///创建一个返回1的Future对象（使用构造函数）
    var future_1 = Future(() {
      print('future_1');

      ///会返回一个新的Future对象
      return 1;
    });

    ///返回一个特定值的对象（使用value方法）
    var future_2 = Future.value(2);

    ///返回一个错误信息
    var future_3 = Future.error('error');

    ///使用Future.error的例子
    future_2.then((value) {
      return future_3;
    }).catchError((error) {
      print(error);
    });

    ///延时执行，可以考虑使用Timer，delay内部也是使用了Timer
    Future.delayed(const Duration(seconds: 2), () {
      ///执行具体任务
    });
  }

  void _baseStream() {
    var stream =
        Stream.fromFuture(Future.delayed(const Duration(seconds: 2), () {
      return '';
    }));
    stream.listen((event) {
      print(event);
    });

    Stream<int> stream1= timedCounter(Duration(seconds: 1), 4);
    stream1.forEach((element) {
      print(element);
    });
    //stream.take(2);
  }

  Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      print('timedCounter:${i}');
      if (i == maxCount) break;
    }
  }

  void _futureException() async {
    ///这边的异常需要使用try..catch捕捉
    try {
      await _testException();
    } catch (e) {
      print(e.toString());
    }

    ///回调方式也获取不到异常，必须使用try...catch....
    try {
      _testException()
          .then((value) {}, onError: (error) {})
          .catchError((error) {});
    } catch (e) {
      print(e.toString());
    }

    ///测试onError和catchError异常
    ///onError只能处理当前的错误Future，而不能处理其他有错误的Future
    ///catchError可以捕获到Future链中抛出的所有错误
    _testThenException().then((value) {
      throw Exception('我是个异常');
    }, onError: (error) {
      print('onError_1:$error');
    }).then((value) {}, onError: (error) {
      ///onError只可以捕获上层(then和onError里面)的异常，一般不使用，一般直接使用catchError
      print('onError_2:$error');
      throw Exception('onError');
    }).catchError((error) {
      ///catchError可以捕获整个链式的异常
      print('catchError:$error');
    }).whenComplete(() {
      ///这个肯定会执行
      print('complete');
    });
  }

  Future _testException() {
    throw Exception('我是异常');
  }

  ///正常返回值
  Future _testThenException() {
    return Future(() => 1);
  }

  ///高级用法
  _advancedFuture() {
    ///for each
    Future.forEach({1, 2, 3}, (num) {
      return Future.delayed(Duration(seconds: num), () {
        print(num);
      });
    });

    ///wait 执行多个 Future，等待所有的 Future 执行完成。可以获取到所有的返回结果
    Future.wait([
      Future(() {
        return 1;
      }),
      Future(() {
        return 2;
      })
    ]).then((value) {
      print('wait:${value[0]},${value[1]}');
    });

    ///any 执行多个 Future,哪个先执行完成，就返回对应的数据。只能返回第一个的结果
    Future.any([
      Future(() {
        return 1;
      }),
      Future(() {
        return 2;
      })
    ]).then((value) {
      print('any:${value}');
    });
  }

  void _microTaskFuture() {
    Future(() {
      print('future:1');
    });

    sleep(const Duration(seconds: 1));

    ///总是会优先执行这个任务
    Future.microtask(() {
      print('microtask:2');
    });
  }
}
