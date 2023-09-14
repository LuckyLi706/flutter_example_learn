import 'package:flutter/cupertino.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/ui/layout/pages/column_page.dart';
import 'package:flutter_example_learn/ui/layout/pages/listview_page.dart';
import 'package:flutter_example_learn/ui/layout/pages/row_page.dart';
import 'package:flutter_example_learn/ui/layout/pages/stack_page.dart';
import 'package:flutter_example_learn/ui/layout/pages/wrap_page.dart';
import 'package:flutter_example_learn/util/route_util.dart';

import 'gridview_page.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/11 15:33
/// @Description  布局页面
class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutPageState();
  }
}

class _LayoutPageState extends BasePageState<LayoutPage> {
  @override
  Widget initWidget() {
    return Column(
      children: [
        CommonButton('Column', () {
          RouteUtil.push(const ColumnPage());
        }),
        CommonButton('Row', () {
          RouteUtil.push(const RowPage());
        }),
        CommonButton('Wrap', () {
          RouteUtil.push(const WrapPage());
        }),
        CommonButton('Stack', () {
          RouteUtil.push(const StackPage());
        }),
        CommonButton('ListView', () {
          RouteUtil.push(ListViewPage());
        }),
        CommonButton('GridView', () {
          RouteUtil.push(GridViewPage());
        })
      ],
    );
  }

  @override
  String appBarTitle() {
    return S.of(context).layout;
  }
}
