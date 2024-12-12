import 'package:flutter/material.dart';

void navigateToNewPage(
  BuildContext context, {
  required Widget navigateToPage,
}) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => navigateToPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
          .animate(CurvedAnimation(
        parent: animation,
        curve: Curves.decelerate,
      ));

      return SlideTransition(
        position: tween,
        child: child,
      );
    },
  ));
}
