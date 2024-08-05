import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T>(Widget page) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page, RoutePredicate predicate) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (_) => page,
      ),
      predicate,
    );
  }

  void pop<T>() {
    return Navigator.pop<T>(this);
  }

  void popUntil(RoutePredicate predicate) {
    return Navigator.popUntil(this, predicate);
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName,
        arguments: arguments);
  }
}
