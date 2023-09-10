import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/ui/open_library/model/provider_change_notifier_model.dart';
import 'package:flutter_example_learn/ui/open_library/model/provider_model.dart';
import 'package:flutter_example_learn/ui/open_library/model/provider_selector_model.dart';
import 'package:flutter_example_learn/ui/open_library/model/proxy_provider_model.dart';
import 'package:flutter_example_learn/util/log_util.dart';
import 'package:provider/provider.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/6 13:47
/// @Description Provider 状态管理
class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProviderPageState();
  }
}

class _ProviderPageState extends BasePageState<ProviderPage> {
  ProviderChangeNotifierModel providerChangeNotifierModel = ProviderChangeNotifierModel();
  ProviderSelectorModel providerSelectorModel = ProviderSelectorModel();

  @override
  String appBarTitle() {
    return 'Provider';
  }

  @override
  Widget initWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CommonText('Provider'),

          ///最基础的 provider 组成，接收一个任意值并暴露它，但是并不会更新UI
          ///lazy 默认为true，为true表示使用值的时候才回去创建对象，为false表示立即创建对象
          ///如果使用已存在的对象，使用Provider.value(value:对象)，
          ///dispose表示对象被销毁时候调用
          Provider(
            lazy: false,
            create: (context) {
              printLog('create');
              return ProviderModel();
            },
            dispose: (context, providerModel) {
              printLog('dispose');
            },
            child: _ProviderWidget(),
          ),

          const CommonText('ChangeNotifierProvider'),
          ChangeNotifierProvider<ProviderChangeNotifierModel>.value(
            value: providerChangeNotifierModel,
            child: Column(
              children: [
                CommonButton('更新', () {
                  providerChangeNotifierModel.count = 0;
                }),

                ///最小刷新方案一：使用Consumer组件刷新，包裹最小刷新的范围
                ///child里面的Widget是不需要刷新的范围
                Consumer<ProviderChangeNotifierModel>(
                  builder: (context, model, child) {
                    return Column(
                      children: [Text(model.count.toString()), child!],
                    );
                  },

                  ///这边的child就是builder里面的child，可以不填。这边的Widget是不需要的
                  child: const Text('此处不需要刷新'),
                ),

                ///最小刷新方案二：使用Builder包裹，刷新最小范围
                Builder(builder: (context) {
                  return Text(Provider.of<ProviderChangeNotifierModel>(context, listen: true).count.toString());
                }),

                ///例子，看看是否会刷新该位置
                Builder(builder: (context) {
                  printLog('ChangeNotifierProvider is update');
                  return Container();
                }),

                ///可变化的Widget刷新最小位置
                _ChangeNotifierProviderWidget(),

                ///可变Widget刷新最小位置
                _ChangeNotifierProviderWidgetTwo(),
              ],
            ),
          ),
          const CommonText('Selector'),

          ChangeNotifierProvider.value(
            value: providerSelectorModel,
            child: Container(
              height: 100,
              color: Colors.deepOrangeAccent,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  /// Selector 是Consumer的扩展版，更细小化的更新Widget
                  /// 如果现在有个ListView，如果我只想依据某个规则去更新里面某一项，Consumer就做不到了
                  /// 这时候就可以使用Selector选择器，根据条件来只更新某一项
                  return Selector<ProviderSelectorModel, SingleModel>(
                    ///这边的model对应Selector的第二个参数
                    builder: (context, model, child) {
                      ///除了第一次，其他只会重建Widget一次
                      printLog('Selector builder $index');
                      return Row(
                        children: [
                          Text(model.name),
                          Checkbox(
                            value: model.isCheck,
                            onChanged: (bool? value) {
                              // model.isCheck = value!;
                              Provider.of<ProviderSelectorModel>(context, listen: false).updateSingle(index);
                            },
                          )
                        ],
                      );
                    },

                    ///是一个 Function，传入 Value ，要求我们返回 Value 中具体使用到的属性。
                    ///对应Selector的第一个参数
                    selector: (_, providerChangeNotifierModel) {
                      return providerChangeNotifierModel.singleModel[index];
                    },

                    ///这个 Function 会传入两个值，其中一个为之前保持的旧值，以及此次由 selector 返回的新值，
                    ///我们就是通过这个参数控制是否需要刷新 builder 内的 Widget。如果不实现shouldRebuild ，
                    ///默认会对 pre 和 next 进行深比较（deeply compares）。如果不相同，则返回 true
                    ///对应Selector的第二个参数，有时候我们想要去比较多个对象，可以借助Tuple包裹多个对象
                    shouldRebuild: (pre, next) {
                      ///这边其实可以不实现，默认是对比两个对象，我这边实现去更细小化的比较
                      return pre.isCheck != next.isCheck;
                    },
                  );
                },
                itemCount: providerSelectorModel.singleModel.length,
              ),
            ),
          ),

          const CommonText('ProxyProvider'),
          ChangeNotifierProvider(
            create: (context) => ProxyProviderModel(),

            ///我们日常开发中会遇到一种模型嵌套另一种模型、或一种模型的参数用到另一种模型的值、
            ///或是需要几种模型的值组合成一个新的模型的情况，在这种情况下，就可以使用 ProxyProvider
            ///ProxyProviderModel发生改变会通知ProxyProviderNewModel，去执行update
            child: ProxyProvider<ProxyProviderModel, ProxyProviderNewModel>(
              ///value 为发生改变的那个model（既为ProxyProviderModel）
              ///previous为上次更新的model，（既ProxyProviderNewModel）第一次为null
              update: (BuildContext context, value, previous) {
                return ProxyProviderNewModel(value.name);
              },
              child: Column(
                children: [
                  Consumer<ProxyProviderModel>(builder: (context, model, child) {
                    return CommonButton('更新', () {
                      context.read<ProxyProviderModel>().name = '更新值';
                    });
                  }),
                  Consumer<ProxyProviderNewModel>(builder: (context, model, child) {
                    return Text(Provider.of<ProxyProviderNewModel>(context).name);
                  }),
                ],
              ),
            ),
          ),

          const CommonText('FutureProvider'),

          ///FutureProvider有一个初始值，接收一个 Future，并在其进入 complete 状态时更新依赖它的组件。
          FutureProvider(
            create: (context) => getFutureProviderValue(),
            initialData: '初始化',
            child: _FutureProviderWidget(),
          ),

          const CommonText('StreamProvider'),

          ///监听流，并暴露出当前的最新值，并多次触发重新构建UI。
          StreamProvider(
            create: (context) => getFutureStream(),
            initialData: '初始化',
            child: _FutureProviderWidget(),
          )
        ],
      ),
    );
  }

  ///建立一个延迟任务
  Future<String> getFutureProviderValue() {
    return Future.delayed(const Duration(seconds: 3), () {
      return 'FutureProvider更新值：10';
    });
  }

  ///构建延时的流
  Stream<String> getFutureStream() {
    return Stream<String>.periodic(const Duration(seconds: 1), (value) {
      return "StreamProvider ---  $value";
    });
  }
}

class _ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.watch<ProviderModel>().count.toString()),
      ],
    );
  }
}

///针对无状态的Widget
class _ChangeNotifierProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    printLog('_ChangeNotifierProviderWidget build');

    ///Provider.of方法中默认listen为true，如果为false，表示不监听model的变化
    ///这边只使用在按钮中，所以不需要监听变化
    ///等同于context.read<T>() 方法
    final providerChangeNotifierModel = Provider.of<ProviderChangeNotifierModel>(context, listen: false);
    return Column(
      children: [
        CommonButton('_ChangeNotifierProviderWidget', () {
          providerChangeNotifierModel.count = 0;
        }),
        Builder(builder: (context) {
          /// 获取我的model，Provider.of方法中默认listen为true，如果为ture，表示监听model的变化
          /// model变化，则会刷新对应context下的Widget
          /// 等同于context.watch<T>()方法
          final providerChangeNotifierModel = Provider.of<ProviderChangeNotifierModel>(context, listen: true);
          return Text(providerChangeNotifierModel.count.toString());
        }),
        //Text(providerNotifier.text),
      ],
    );
  }
}

///针对有状态的Widget
class _ChangeNotifierProviderWidgetTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangeNotifierProviderWidgetTwoState();
  }
}

class _ChangeNotifierProviderWidgetTwoState extends State<_ChangeNotifierProviderWidgetTwo> {
  late ProviderChangeNotifierModel providerChangeNotifierModel;

  @override
  void initState() {
    ///这边只会执行一次
    super.initState();
    printLog('_ChangeNotifierProviderWidgetTwoState initState');
  }

  @override
  Widget build(BuildContext context) {
    printLog('_ChangeNotifierProviderWidgetTwoState build');

    /// 这边监听为true，并且context使用build的，所有会刷新build里面的所有Widget
    /// 先执行didChangeDependencies方法然后执行build方法
    /// 控制最小范围，如果监听为true，尽可能不要放在build下面。不然会刷新build的Widget
    /// 如果需要监听变化，providerChangeNotifierModel尽可能放在最小刷新的Widget内
    providerChangeNotifierModel = Provider.of<ProviderChangeNotifierModel>(context, listen: true);
    return Column(
      children: [
        Builder(builder: (context) {
          ///这样做只会刷新这个Text，不然的话会刷新整个_TextWidget
          ///这边会去取上级的context来获取值,所以watch不能和ChangeNotifierProvider使用同级的context
          return Column(
            children: [
              ///这是个例子，
              Text(providerChangeNotifierModel.count.toString()),

              Text(context.watch<ProviderChangeNotifierModel>().count.toString())
            ],
          );
        })
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    printLog('didChangeDependencies');
  }
}

class _FutureProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    printLog('build');
    return Column(
      children: [
        Builder(builder: (context) {
          return Text(context.watch<String>());
        }),
        Container(),
      ],
    );
  }
}
