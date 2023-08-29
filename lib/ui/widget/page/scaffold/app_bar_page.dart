import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar/tab_bar_page_one.dart';
import 'package:flutter_example_learn/ui/widget/page/scaffold/app_bar/tab_bar_page_two.dart';
import 'package:flutter_example_learn/util/screen_util.dart';

import 'app_bar/tab_bar_page_three.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/18 16:02
/// @Description AppBar
class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarPageState();
}

class _AppBarPageState extends BasePageState<AppBarPage> {
  @override
  Widget initWidget() {
    return Column(
      children: [
        CommonButton('TabBar_1', () {
          Navigator.of(context).push(MaterialPageRoute(builder: (route) {
            return const TabBarPageOne();
          }));
        }),
        CommonButton('TabBar_2', () {
          Navigator.of(context).push(MaterialPageRoute(builder: (route) {
            return const TabBarPageTwo();
          }));
        }),
        CommonButton('TabBar_3', () {
          Navigator.of(context).push(MaterialPageRoute(builder: (route) {
            return const TabBarPageThree();
          }));
        })
      ],
    );
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

          /// 隐藏的菜单,使用popupMenu弹出来
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              _selectView(Icons.message, '发起群聊', 'A'),
              _selectView(Icons.group_add, '添加服务', 'B'),
              _selectView(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          ),
        ],

        ///给右边的所有的菜单组件设置统一的主题
        actionsIconTheme: const IconThemeData(
          size: 20,
          color: Colors.green,
        ),

        ///设置左边图标的样式
        iconTheme: const IconThemeData(size: 20, color: Colors.purple),

        ///灵活区域，相当于给appbar+statusBar的区域加了个遮罩
        ///该组件将通过 Stack 叠放在 AppBar 下方
        ///会覆盖背景色
        flexibleSpace: SizedBox(
          height: ScreenUtil.statusBarHeight() + 60,
          width: double.infinity,
          child: Image.network(
            'https://images.pexels.com/photos/850359/pexels-photo-850359.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
            fit: BoxFit.cover,
          ),
        ),

        ///在AppBar的下面，可以实现顶部导航栏
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            color: Colors.blue,
            height: 20,
            child: const Center(
              child: Text('bottom'),
            ),
          ),
        ),

        ///阴影深度
        elevation: 10,

        ///阴影颜色
        shadowColor: Colors.red,

        ///设置Appbar的边框
        ///shape:

        ///AppBar的背景色
        backgroundColor: Colors.yellow,

        ///AppBar的前景色
        foregroundColor: Colors.red,

        ///不明白啥意思。默认false
        ///excludeHeaderSemantics:true,

        ///AppBar上面展示的Widget的透明度,默认是1
        toolbarOpacity: 0.8,

        ///AppBar底部展示的Widget的透明度,默认是1
        bottomOpacity: 1,

        ///定义Appbar的高度
        toolbarHeight: 60,

        ///这个属性用来设置状态栏的颜色风格
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),

        ///强制移除背景色和阴影，默认是false，不影响flexibleSpace属性
        forceMaterialTransparency: false);
  }

  // 返回每个隐藏的菜单项
  _selectView(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
        value: id,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, color: Colors.blue),
            Text(text),
          ],
        ));
  }
}
