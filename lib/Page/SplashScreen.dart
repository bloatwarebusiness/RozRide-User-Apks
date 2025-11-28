import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nagola/Help/AppColor.dart';
import 'package:nagola/Page/HomePage.dart';
import 'package:nagola/Page/LoginPage.dart';
import 'package:nagola/Page/OtpPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Fade-in animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    // Navigate to LoginPage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      // Restore status bar
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfessionalLoginPage()),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => OtpPage(phoneNumber: "8744981113")),
      // );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => HomePage()),
      // );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Logo with Shadow
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColor.second,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(4),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // App Name
              Text(
                "ROZZRIDE",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: 8),

              // Tagline

            ],
          ),
        ),
      ),
    );
  }
}
