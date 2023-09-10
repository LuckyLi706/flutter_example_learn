import 'package:flutter/foundation.dart';

/// @Classname log_util
/// @Date 2023/9/10 18:02
/// @Created by lijie
/// @Email jackyli706@gmil.com
/// @Description 对应日志相关

printLog(Object log) {
  if (kDebugMode) {
    print(log);
  }
}
