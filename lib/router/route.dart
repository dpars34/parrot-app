import 'package:flutter/material.dart';

import 'package:parrot_app/screens/home/home_screen.dart';
import 'package:parrot_app/screens/detail/detail_screen.dart';

Map<String, WidgetBuilder> appRouter() {
  return {
    HomeScreen.route: (context) => const HomeScreen(title: 'ホーム'),
    DetailScreen.route: (context) => const DetailScreen(title: '詳細画面')

  };
}
