import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:flutter_example_learn/common/widget/common_button.dart';
import 'package:flutter_example_learn/common/widget/common_text.dart';
import 'package:flutter_example_learn/generated/l10n.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_locale_notifier.dart';
import 'package:flutter_example_learn/ui/widget/notifer/change_theme_notifier.dart';
import 'package:provider/provider.dart';

/// @Classname material_app_page
/// @Date 2023/7/30 10:26
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 初始化配置
class MaterialAppPage extends StatefulWidget {
  const MaterialAppPage({super.key});

  @override
  State<MaterialAppPage> createState() {
    return _MaterialAppPage();
  }
}

class _MaterialAppPage extends BasePageState<MaterialAppPage> {
  final List<Color> themeColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  @override
  Widget initWidget() {
    return Column(
      children: [
        CommonText(S.of(context).theme_change),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _getListWidget(),
        ),
        CommonText(
            '${S.of(context).current_language}：${Provider.of<ChangeLocaleNotifier>(context).locale.languageCode}-${Provider.of<ChangeLocaleNotifier>(context).locale.countryCode}'),
        CommonButton(S.of(context).locale_change, () {
          ChangeLocaleNotifier notifier =
              Provider.of<ChangeLocaleNotifier>(context, listen: false);
          if (notifier.locale.languageCode == 'en') {
            notifier.locale = const Locale('zh', 'CN');
          } else {
            notifier.locale = const Locale('en', 'US');
          }
        })
      ],
    );
  }

  List<Widget> _getListWidget() {
    List<Widget> listWidget = [];
    for (int i = 0; i < themeColors.length; i++) {
      listWidget.add(Container(
        color: themeColors[i],
        height: 50,
        width: 50,
        child: InkWell(
          onTap: () {
            ChangeThemeNotifier notifier =
                Provider.of<ChangeThemeNotifier>(context, listen: false);
            notifier.themeData = ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: themeColors[i]));
          },
        ),
      ));
    }
    return listWidget;
  }

  @override
  String appBarTitle() {
    return 'MaterialApp';
  }
}
