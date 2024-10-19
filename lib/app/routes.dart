// lib/app/routes.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/bottom_navigation_bar.dart';
import '../features/chellenges/presentation/chellenges_page.dart';
import '../features/coin/presentation/coin_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/chats/presentation/chats_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(
              currentLocation:
                  state.matchedLocation), // Передаём текущий маршрут
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/challenges',
          name: 'challenges',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ChallengesPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        // Аналогично для остальных маршрутов
        GoRoute(
          path: '/chats',
          name: 'chats',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ChatsPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/coins',
          name: 'coins',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const CoinsPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
