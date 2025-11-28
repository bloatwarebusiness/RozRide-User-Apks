import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    final Color normalTextColor = Colors.white.withOpacity(0.9); // #E6FFFFFF
    final Color linkTextColor = const Color(0xFF50BA7E); // #50BA7E

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 13,
              color: normalTextColor,
            ),
            children: [
               TextSpan(text: 'By continuing, you agree to our ',style: TextStyle(color:Colors.white)),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: linkTextColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle Terms of Service click
                    print('Terms of Service clicked');
                  },
              ),
             TextSpan(text: ' and ',style: TextStyle(color:Colors.white)),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: linkTextColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle Privacy Policy click
                    print('Privacy Policy clicked');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
