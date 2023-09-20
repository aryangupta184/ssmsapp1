import 'package:flutter/material.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/presentation/onboarding_screen.dart';
import 'package:ssmsapp1/presentation/profile.dart';
import 'package:ssmsapp1/presentation/signup_screen.dart';
import 'package:ssmsapp1/presentation/test.dart';


class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String signupSuccessNotificationScreen = '/signup_success_notification_screen';

  static const String homeScreen = '/home_screen';

  static const String profileScreen = '/profile_screen';



  static const String pitstopScreen = '/pitstop_screen';

  static const String financeManagePage = '/finance_manage_page';




  static const String messExtraScreen = '/mess_extra_screen';





  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    signUpScreen: (context) => SignUpScreen(),
    // signupSuccessNotificationScreen: (context) =>
    //     SignupSuccessNotificationScreen(),
    homeScreen: (context) => HomeScreen(),
    profileScreen: (context) => ProfileScreen(),
    // pitstopScreen: (context) => PitstopScreen(),
    // financeManageContainerScreen: (context) => FinanceManageContainerScreen(),
    // pitstopOneScreen: (context) => PitstopOneScreen(),
    // messExtraScreen: (context) => MessExtraScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen()
  };
}
