import 'package:flutter/material.dart';
import 'package:post_screen/core/utils/components.dart';
import 'package:post_screen/features/add_post/presentation/pages/add_post_screen.dart';

import '../features/home/presentation/pages/home_screen.dart';

class Routes {
  static const String homeScreen = "/";
  static const String addPostScreen = "addPost";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      case Routes.addPostScreen:
        return MaterialPageRoute(builder: (context) {
          return const AddPostScreen();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return unDefineRoute();
        });
    }
  }
}
