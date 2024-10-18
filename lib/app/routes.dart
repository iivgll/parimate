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
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),
        GoRoute(
          path: '/challenges',
          name: 'challenges',
          builder: (BuildContext context, GoRouterState state) =>
              const ChallengesPage(),
        ),
        GoRoute(
          path: '/chats',
          name: 'chats',
          builder: (BuildContext context, GoRouterState state) =>
              const ChatsPage(),
        ),
        GoRoute(
          path: '/coins',
          name: 'coins',
          builder: (BuildContext context, GoRouterState state) =>
              const CoinsPage(),
        ),
      ],
    ),
  ],
);
