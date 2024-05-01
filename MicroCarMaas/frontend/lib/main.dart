import 'package:flutter/material.dart';
import 'package:frontend/navigation/app_navigation.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/home/home_pagee_silinecek.dart';
import 'package:frontend/pages/home/homee_page_silinecek.dart';
import 'package:frontend/pages/login/login_page.dart';
import 'package:frontend/pages/login/otp_page.dart';
import 'package:frontend/pages/men%C3%BC/menu_page.dart';
import 'package:frontend/pages/onborading/onboarding_page.dart';
import 'package:frontend/pages/ehliyet_register_verification/email_page_2.dart';
import 'package:frontend/pages/profil/profil_page.dart';
import 'package:frontend/pages/profil/profil_page_edit.dart';
import 'package:frontend/pages/ehliyet_register_verification/register_page.dart';
import 'package:frontend/pages/ehliyet_register_verification/email_page_1.dart';
import 'package:frontend/pages/ehliyet_register_verification/driver_page.dart';
import 'package:frontend/providers/app_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/pages/credit_cards/cards_page.dart';
import 'package:frontend/pages/credit_cards/add_cards_page.dart';
import 'package:frontend/pages/privacy_policy/privacy_policy.dart';
import 'package:frontend/pages/destek/destek.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "OTOKAR",
      routerConfig: AppNavigation.router,

      //initialRoute: "register_page",
      /*routes: {
        "home": (context) => const HomePage(),
        "homee": (context) => const Home(),
        "homeee": (context) => const HomeePagee(),
        "onboarding": (context) => const OnboardingPage(),
        "login": (context) => const LoginPage(),
        "otp": (context) => const Otp(),
        "register": (context) => const RegisterPage(),
        "email_page_1": (context) => const EmailPage1(),
        "email_page_2": (context) => const EmailPage2(),
        "driver_page": (context) => const DriverPage(),
        "profil_page_edit": (context) => const ProfilPage(),
        "profil_page": (context) => const ProfilPage2(),
        "menu": (context) => const MenuPage(),
        "credit_cards": (context) => const CardsPage(),
        "add_cards_page": (context) => const AddCardsPage(),
      },*/
    );
  }
}
