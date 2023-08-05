import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// @Classname common_pc_bar
/// @Date 2023/8/5 13:00
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 自定义pc端的title bar
const double kWindowCaptionHeight = 32;

/// A widget to simulate the title bar of windows 11.
///
/// {@tool snippet}
///
/// ```dart
/// Scaffold(
///   appBar: PreferredSize(
///     child: WindowCaption(
///       brightness: Theme.of(context).brightness,
///       title: Text('window_manager_example'),
///     ),
///     preferredSize: const Size.fromHeight(kWindowCaptionHeight),
///   ),
/// )
/// ```
/// {@end-tool}
class CommonPCTitleBar extends StatefulWidget {
  const CommonPCTitleBar({
    Key? key,
    this.title,
    this.backgroundColor,
    this.brightness,
  }) : super(key: key);

  final Widget? title;
  final Color? backgroundColor;
  final Brightness? brightness;

  @override
  State<CommonPCTitleBar> createState() => _CommonPCTitleBarState();
}

class _CommonPCTitleBarState extends State<CommonPCTitleBar>
    with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            (widget.brightness == Brightness.dark
                ? const Color(0xff1C1C1C)
                : Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: SizedBox(
                //height: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: widget.brightness == Brightness.light
                              ? Colors.black.withOpacity(0.8956)
                              : Colors.white,
                          fontSize: 14,
                        ),
                        child: widget.title ?? Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          WindowCaptionButton.minimize(
            brightness: widget.brightness,
            onPressed: () async {
              bool isMinimized = await windowManager.isMinimized();
              if (isMinimized) {
                windowManager.restore();
              } else {
                windowManager.minimize();
              }
            },
          ),
          FutureBuilder<bool>(
            future: windowManager.isMaximized(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == true) {
                return WindowCaptionButton.unmaximize(
                  brightness: widget.brightness,
                  onPressed: () {
                    windowManager.unmaximize();
                  },
                );
              }
              return WindowCaptionButton.maximize(
                brightness: widget.brightness,
                onPressed: () {
                  windowManager.maximize();
                },
              );
            },
          ),
          WindowCaptionButton.close(
            brightness: widget.brightness,
            onPressed: () {
              windowManager.close();
            },
          ),
        ],
      ),
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}
