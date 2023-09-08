// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `learn Flutter`
  String get app_title {
    return Intl.message(
      'learn Flutter',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `main page`
  String get main_page {
    return Intl.message(
      'main page',
      name: 'main_page',
      desc: '',
      args: [],
    );
  }

  /// `Widget`
  String get widget {
    return Intl.message(
      'Widget',
      name: 'widget',
      desc: '',
      args: [],
    );
  }

  /// `static route and dynamic route`
  String get static_dynamic_route {
    return Intl.message(
      'static route and dynamic route',
      name: 'static_dynamic_route',
      desc: '',
      args: [],
    );
  }

  /// `change theme`
  String get theme_change {
    return Intl.message(
      'change theme',
      name: 'theme_change',
      desc: '',
      args: [],
    );
  }

  /// `current language`
  String get current_language {
    return Intl.message(
      'current language',
      name: 'current_language',
      desc: '',
      args: [],
    );
  }

  /// `changeLocale`
  String get locale_change {
    return Intl.message(
      'changeLocale',
      name: 'locale_change',
      desc: '',
      args: [],
    );
  }

  /// `Route`
  String get route {
    return Intl.message(
      'Route',
      name: 'route',
      desc: '',
      args: [],
    );
  }

  /// `static route`
  String get static_route {
    return Intl.message(
      'static route',
      name: 'static_route',
      desc: '',
      args: [],
    );
  }

  /// `dynamic route`
  String get dynamic_route {
    return Intl.message(
      'dynamic route',
      name: 'dynamic_route',
      desc: '',
      args: [],
    );
  }

  /// `route animation`
  String get route_animation {
    return Intl.message(
      'route animation',
      name: 'route_animation',
      desc: '',
      args: [],
    );
  }

  /// `other`
  String get other {
    return Intl.message(
      'other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `multi thread`
  String get multi_thread {
    return Intl.message(
      'multi thread',
      name: 'multi_thread',
      desc: '',
      args: [],
    );
  }

  /// `Future and Stream`
  String get future_and_stream {
    return Intl.message(
      'Future and Stream',
      name: 'future_and_stream',
      desc: '',
      args: [],
    );
  }

  /// `Base Future`
  String get base_future {
    return Intl.message(
      'Base Future',
      name: 'base_future',
      desc: '',
      args: [],
    );
  }

  /// `Future Exception`
  String get exception_future {
    return Intl.message(
      'Future Exception',
      name: 'exception_future',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Future`
  String get advanced_future {
    return Intl.message(
      'Advanced Future',
      name: 'advanced_future',
      desc: '',
      args: [],
    );
  }

  /// `microTask Queue`
  String get micro_task_queue {
    return Intl.message(
      'microTask Queue',
      name: 'micro_task_queue',
      desc: '',
      args: [],
    );
  }

  /// `create stream`
  String get create_stream {
    return Intl.message(
      'create stream',
      name: 'create_stream',
      desc: '',
      args: [],
    );
  }

  /// `transform stream`
  String get transform_stream {
    return Intl.message(
      'transform stream',
      name: 'transform_stream',
      desc: '',
      args: [],
    );
  }

  /// `listen stream`
  String get listen_stream {
    return Intl.message(
      'listen stream',
      name: 'listen_stream',
      desc: '',
      args: [],
    );
  }

  /// `stream type`
  String get stream_type {
    return Intl.message(
      'stream type',
      name: 'stream_type',
      desc: '',
      args: [],
    );
  }

  /// `open source library`
  String get open_source_library {
    return Intl.message(
      'open source library',
      name: 'open_source_library',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
