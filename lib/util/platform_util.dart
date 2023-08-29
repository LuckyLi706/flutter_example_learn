import 'dart:io';

import 'package:flutter/foundation.dart';

/// @Classname platform_util
/// @Date 2023/8/5 13:06
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 平台工具类
class PlatformUtil {
  static bool isPC() {
    if (isWeb()) {
      return false;
    }

    ///如果是web端直接判断下面的平台会抛出异常Unsupported operation: Platform._operatingSystem
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  static bool isMobile() {
    if (isWeb()) {
      return false;
    }

    ///如果是web端直接判断下面的平台会抛出异常Unsupported operation: Platform._operatingSystem
    return Platform.isAndroid || Platform.isIOS;
  }

  static bool isWeb() {
    return kIsWeb == true;
  }
}
