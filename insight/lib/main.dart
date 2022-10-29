import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/theme.dart';
import 'package:insight/providers/categories_provider.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/screens/bottom_navigation.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';
import 'package:insight/screens/onboarding/get_started_screen.dart';
import 'package:insight/screens/onboarding/sign_up_screen.dart';
import 'package:insight/screens/inner_screens.dart/message_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<User>(
          create: (context) => User(),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: AppTheme.appTheme(),
        home: const GetStartedScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          NavigationScreen.routeName: (context) => const NavigationScreen(),
          MessageScreen.routeName: (context) => const MessageScreen(),
          PitchDetailScreen.routeName: (context) => const PitchDetailScreen(),
        },
      ),
    );
  }
}
