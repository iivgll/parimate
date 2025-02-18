import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/features/settings/presentation/settings_page.dart';

import '../common/widgets/bottom_navigation_bar.dart';
import '../features/chellenges/presentation/challenge_details_page.dart';
import '../features/chellenges/presentation/chellenges_page.dart';
import '../features/chellenges/presentation/challenge_preview_page.dart';
import '../features/coin/presentation/coin_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/chats/presentation/chats_page.dart';
import '../models/challenge_model.dart';

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
        GoRoute(
          path: '/challenge-details',
          name: 'challengeDetails',
          builder: (BuildContext context, GoRouterState state) {
            final challenge = state.extra as ChallengeModel;
            return ChallengeDetailsPage(challenge: challenge);
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
        GoRoute(
          path: '/challenge-preview',
          builder: (context, state) {
            final Map<String, dynamic> params =
                state.extra as Map<String, dynamic>;
            return ChallengePreviewPage(
              challenge: params['challenge'] as Map<String, dynamic>,
              isCreating: params['isCreating'] as bool? ?? false,
              joinLink: params['joinLink'] as String?,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
