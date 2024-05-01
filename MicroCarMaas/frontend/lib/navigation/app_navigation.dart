import 'package:flutter/material.dart';
import 'package:frontend/pages/credit_cards/add_cards_page.dart';
import 'package:frontend/pages/credit_cards/cards_page.dart';
import 'package:frontend/pages/destek/destek.dart';
import 'package:frontend/pages/ehliyet/ehliyet_page.dart';
import 'package:frontend/pages/ehliyet_register_verification/register_page.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/login/login_page.dart';
import 'package:frontend/pages/login/otp_page.dart';
import 'package:frontend/pages/men%C3%BC/menu_page.dart';
import 'package:frontend/pages/onborading/onboarding_page.dart';
import 'package:frontend/pages/privacy_policy/privacy_policy.dart';
import 'package:frontend/pages/profil/profil_page.dart';
import 'package:frontend/pages/profil/profil_page_edit.dart';
import 'package:frontend/pages/settings_page/settings_page.dart';
import 'package:frontend/pages/sss/sss_page.dart';
import 'package:frontend/wrapper/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/onboarding";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'Home');
  static final _shellNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'Profile');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'Settings');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/Home",
                name: "ShellHome",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: [],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: "/profile",
                name: "Profile",
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfilPage2(),
                routes: [
                  GoRoute(
                      path: "menu",
                      name: "menu",
                      pageBuilder: (context, state) {
                        return CustomTransitionPage<void>(
                          key: state.pageKey,
                          child: const MenuPage(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: "profil_page_edit",
                          name: "profil_page_edit",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const ProfilPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "credit_cards",
                          name: "credit_cards",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const CardsPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "add_cards_page",
                          name: "add_cards_page",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const AddCardsPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "ehliyet_page",
                          name: "ehliyet_page",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const EhliyetPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "destek_page",
                          name: "destek_page",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const DestekPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "sss_page",
                          name: "sss_page",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SssPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "policy_page",
                          name: "policy_page",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const PolicyPage(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                      ]),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/Settings",
                name: "Settings",
                builder: (BuildContext context, GoRouterState state) =>
                    SettingsPage(),
                routes: [],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/onboarding',
        name: "Onboarding",
        builder: (context, state) => OnboardingPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: "Login",
        builder: (context, state) => LoginPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/otp',
        name: "Otp",
        builder: (context, state) => Otp(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
