import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void pushTo(String routeName) {
    push(routeName);
  }

  void pushWithReplacement(String routeName) {
    pushReplacement(routeName);
  }

  void pushToBase(String routeName) {
    go(routeName);
  }
}
