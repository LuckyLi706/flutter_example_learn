import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/ui/open_library/notifier/provider_notifier.dart';
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

/// Provider 会监听 Value 的变化而更新整个 context 上下文，因此如果 build 方法返回的 Widget 过大过于复杂的话，刷新的成本是非常高的
/// 方案1：将真正需要更新的 Widget 封装成一个独立的 Widget，将取值方法放到该 Widget 内部。
/// 方案2：另一个相对好一点的办法是使用 Builder 方法创造一个范围更小的 context。
/// 方案3：使用Consumer包裹需要刷新的某个Widget
/// https://juejin.cn/post/7067356022272163847
/// https://stackoverflow.com/questions/68811249/tried-to-use-provider-with-a-subtype-of-listenable-stream
/// https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md
class _ProviderPageState extends BasePageState<ProviderPage> {
  ProviderNotifier providerNotifier = ProviderNotifier();

  @override
  String appBarTitle() {
    return 'Provider';
  }

  @override
  Widget initWidget() {
    print('333333');
    return Provider<ProviderNotifier>(
        create: (_) {
          return providerNotifier;
        },
        child: Column(
          children: [
            Consumer<ProviderNotifier>(
              builder: (ctx, person, child) {
                print('2222');
                return Text(person.text);
              },
            ),
            CommonButton('更新值', () {
              providerNotifier.text = '222';
              // providerNotifier.text = '22222';
              // if(providerNotifier.text=='22222'){
              //   providerNotifier.text='333333';
              // }

            }),
            _TextWidget(),
          ],
        ));
  }
}

class _TextWidget extends StatelessWidget {
  //late ProviderNotifier providerNotifier;

  @override
  Widget build(BuildContext context) {
   // providerNotifier = Provider.of(context);
    print('build');
    return Column(
      children: [
        Builder(builder: (context) {
          ///这样做只会刷新这个Text，不然的话会刷新整个_TextWidget
          ///这边会去取上级的context来获取值,所以watch不能和ChangeNotifierProvider使用同级的context
          return Text(context.watch<ProviderNotifier>().text);
        }),
        //Text(providerNotifier.text),
        Container(),
      ],
    );
  }
}
