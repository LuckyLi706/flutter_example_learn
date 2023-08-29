import 'package:flutter/material.dart';
import 'package:flutter_example_learn/util/screen_util.dart';
import 'package:flutter_example_learn/util/toast_util.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/8/23 15:29
/// @Description 可伸缩的AppBar
class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<SliverAppBarPage> createState() {
    return _SliverAppBarPageState();
  }
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  ///可以展开的高度
  final double expandedHeight = ScreenUtil.appBarHeight() + 100;

  ///底部的高度
  final double bottomHeight = 50;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      ///获取appBar展开和收起最大的滑动距离
      double maxScrollLength =
          expandedHeight - ScreenUtil.appBarHeight() - bottomHeight;

      ///监听滑动
      if (_scrollController.offset <= maxScrollLength &&
          _scrollController.offset > 0) {
        ///此数值是真正展开和收起的值
        print(_scrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(

              // title: const Text('SliverAppBar'),
              ///展开高度（长度是appBar的高度+可滑动的距离+bottom的高度）
              expandedHeight: expandedHeight,

              ///折叠的高度，最小为AppBar的高度
              collapsedHeight: ScreenUtil.appBarHeight(),

              ///true 的时候下滑先展示SliverAppBar，展示完成后才展示其他滑动组件内容（默认false）
              floating: false,

              ///snap为true，floating也要为true才会有效果。true的时候会监听你的手势结束时的动作时是下滑，那么SliverAppBar展开，
              ///上滑则是收缩折叠至上一次折叠的位置处，但是这个效果需要一个基础就是存在上一次折叠的位置，否则不生效（默认为false）
              snap: false,

              ///SliverAppBar收缩到最小高度的时候SliverAppBar是否可见，true：SliverAppBar会以折叠高度固定显示在头部，false：缩小到折叠高度后滑出页面（默认为false）
              pinned: true,

              ///true：SliverAppBar完全展开后是否可以继续拉伸，注意这个需要外部滑动组件physics的支持（设置BouncingScrollPhysics()，滑动到标界可以继续滑动拥有回弹效果），
              ///否则是不会生效的（默认是false）
              stretch: false,

              ///拉伸监听触发的偏移（拉伸到10dp就会触发监听）
              stretchTriggerOffset: 10,

              ///拉伸监听
              onStretchTrigger: () {
                return _myOnStretchTrigger();
              },
              elevation: 0,

              ///位于AppBar下面的一个组件，一般可以放置TabBar，其他组件可以使用PreferredSize包裹
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(bottomHeight),
                child: Container(
                  height: bottomHeight,
                  color: Colors.white,
                ),
              ),

              /// 在Appbar的下方，高度会在（状态栏+AppBar+bottom的高度）
              /// 如果存在bottom，bottom的布局会遮挡flexibleSpace下面相同的高度
              /// FlexibleSpaceBar可以实现联动title
              /// 如果存在bottom，可以使用这种方式来展示自己需要展示的内容，以免被bottom遮挡
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    bottom: bottomHeight,
                    child: const Text('222'),
                  )
                ],
              )),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Text('$index')),
              itemExtent: 100)
        ],
      ),
    );
  }

  Future<void> _myOnStretchTrigger() async {
    ToastUtil.showToast('onStretchTrigger');
  }
}
