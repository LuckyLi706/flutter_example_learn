import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/18 16:02
/// @Description
class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarPageState();
}

class _AppBarPageState extends BasePageState<AppBarPage> {
  @override
  Widget initWidget() {
    return Container();
  }

  @override
  String appBarTitle() {
    return 'AppBar';
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      /// Widget - 在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮。
      /// 可以自定义（以下是自定义的）
      leading: GestureDetector(
        child: const Icon(Icons.backspace),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),

      ///是否展示最左边默认的返回控件，默认是展示
      automaticallyImplyLeading: false,

      ///AppBar显示的标题控件，一般放文字
      title: const Text('AppBar'),

      ///标题居中
      //centerTitle: true,

      ///标题距离左边的控件距离，如果默认leading不存在，则会顶边
      ///centerTitle如果为true，则此属性无效
      titleSpacing: 10.0,

      ///一个 Widget 列表，代表 AppBar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
      ///对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.update),
        ),
      ],

      ///给右边的所有的菜单组件设置统一的主题
      actionsIconTheme: const IconThemeData(
        size: 20,
        color: Colors.red,
      ),

      ///灵活区域，相当于给appbar+statusBar的区域加了个遮罩
      flexibleSpace: SizedBox(
        height: ScreenUtil.statusBarHeight() + 60,
        width: double.infinity,
        child: Image.network(
          'https://images.pexels.com/photos/850359/pexels-photo-850359.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
          fit: BoxFit.cover,
        ),
      ),

      bottom: TabBar(
        tabs: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),

      ///定义Appbar的高度
      toolbarHeight: 60,
    );
  }
}
