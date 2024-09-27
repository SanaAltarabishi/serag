import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serag/features/entryPages/presentation/pages/details_seal_page.dart';
import 'package:serag/features/entryPages/presentation/pages/first_page.dart';
import 'package:serag/features/entryPages/presentation/pages/individual_praise_page.dart';
import 'package:serag/features/entryPages/presentation/pages/praise_session_page.dart';
import 'package:serag/features/entryPages/presentation/pages/seal_page.dart';
import 'package:serag/features/entryPages/presentation/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/first',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const FirstPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/seal',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SealPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/individualPraise',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const IndividualPraisePage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/praiseSession',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PraiseSessionPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/details/:index',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: DetailsSealPage(
            index: int.parse(state.pathParameters['index']!),
            sealTitle: state.extra as String,
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
    ],
  );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOut;
    var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: child,
    );
  }
}
