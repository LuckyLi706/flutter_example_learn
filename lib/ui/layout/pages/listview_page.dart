import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_stateless_page.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/12 14:24
/// @Description  ListView
class ListViewPage extends BaseStatelessPage {
  ListViewPage({super.key});

  @override
  String appBarTitle() {
    return 'ListView';
  }

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return super.build(context);
  }

  @override
  Widget initWidget() {
    return Column(
      children: [
        ///ListView,加载少量数据时可以使用,会将数据一次性加载出来
        const CommonText('ListView'),
        Expanded(
            child: ListView(
          ///设置滑动方向，默认垂直方向
          scrollDirection: Axis.vertical,

          ///数据和滑动方向反转
          reverse: true,

          ///指定Item在滑动方向上的高度，用来提高滑动性能。指定了该属性后，Item自己定的高度将失效。
          ///滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
          itemExtent: 30,

          ///列表在你快要滑到加载数据的时候，会提前一步加载好，等到你滑到的时候就会显示出来，
          ///预渲染区域长度，预加载的区域。ListView会在其可视区域的两边留一个cacheExtent长度的区域作为预渲染区域（对于ListView.build或ListView.separated构造函数创建的列表，
          ///不在可视区域和预渲染区域内的子元素不会被创建或会被销毁），设置预加载的区域 cacheExtent 强制设置为了 0.0，从而关闭了“预加载”；
          ///而不至于用户滑到的时候还需要等待一会儿，cacheExtent 就是列表显示的 item 数量，包活预加载的 item，我们可以根据列表长度和 item' 高度自己计算下
          ///默认defaultCacheExtent = 250.0px
          cacheExtent: 5,

          ///shrinkWrap - 是否根据子组件的总长度来设置 ListView 的长度，默认值为 false，所以能滚动。滚动组件相互嵌套时，
          ///shrinkWrap 属性要设置 true 才行，和 NeverScrollableScrollPhysics 配合就能解决滚动冲突
          shrinkWrap: false,
          children: _getListWidget(context!),
        )),

        ///ListView.builder 假如有 1000 个列表，初始渲染时并不会所有都渲染，而只会特定数量的 item
        const CommonText('ListView.builder'),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return _getListWidget(context)[index];
                },
                itemCount: _getListWidget(context!).length)),

        ///ListView.separated 自带一个可以自定义的分割线Widget
        const CommonText('ListView.separated'),
        Expanded(
            child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _getNoDivideListWidget(context)[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            ///分割线
            return const Divider(
              ///组件高
              height: 10,

              ///线粗细
              thickness: 0,

              ///左边距
              indent: 10,

              ///右边距
              endIndent: 10,

              color: Colors.red,
            );
          },
          itemCount: _getListWidget(context!).length,
        )),
        Expanded(
            child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return _getListWidget(context)[index];
          }, childCount: _getListWidget(context!).length),
        )),
      ],
    );
  }

  List<Widget> _getListWidget(BuildContext context) {
    return ListTile.divideTiles(
      context: context,
      color: Colors.yellow,
      tiles: List.generate(30, (index) {
        return ListTile(
          title: Text(
            '$index',
            style: const TextStyle(fontSize: 10),
          ),
          subtitle: Text(
            '$index',
            style: const TextStyle(fontSize: 13),
          ),
        );
      }),
    ).toList();
  }

  List<Widget> _getNoDivideListWidget(BuildContext context) {
    return List.generate(100, (index) {
      return ListTile(
        title: Text(
          '$index',
          style: const TextStyle(fontSize: 10),
        ),
        subtitle: Text(
          '$index',
          style: const TextStyle(fontSize: 13),
        ),
      );
    });
  }
}
