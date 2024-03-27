import 'package:flutter/material.dart';

// Constants
import 'package:to_do/common/constants/colors.dart';

// Screens
import 'package:to_do/screens/splash/get_started.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    const splashDuration = Duration(seconds: 2);

    Future<void> navigateToGetStarted() async {
      await Future.delayed(splashDuration);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStarted(),
        ),
      );
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      navigateToGetStarted();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkYellow),
                backgroundColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
