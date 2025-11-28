import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nagola/Page/HomePage.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage>
    with SingleTickerProviderStateMixin {
  List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  late AnimationController _iconController;
  late Animation<double> _scaleAnimation;

  int timerSeconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();

    _iconController =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
      ..forward();

    _scaleAnimation =
        CurvedAnimation(parent: _iconController, curve: Curves.easeOutBack);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timerSeconds > 0) {
        setState(() => timerSeconds--);
      } else {
        timer!.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    otpControllers.forEach((e) => e.dispose());
    focusNodes.forEach((f) => f.dispose());
    _iconController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    String otp = otpControllers.map((e) => e.text).join();
    if (otp.length == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF1D3557);
    const Color lightBlue = Color(0xFF457B9D);

    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND GRADIENT
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [darkBlue, lightBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// CURVE SHAPE
          Positioned(
            top: -140,
            left: -50,
            right: -50,
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(180),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  /// LOCK ICON ANIMATED
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(26),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [darkBlue, lightBlue],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            blurRadius: 18,
                            offset: const Offset(0, 7),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// TITLE
                  const Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 6),
                  Text(
                    "A 6-digit code was sent to",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.phoneNumber,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// GLASS CARD FOR OTP
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.35)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 22,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, otpBox),
                        ),

                        const SizedBox(height: 26),

                        timerSeconds > 0
                            ? Text(
                          "Resend in 00:${timerSeconds.toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 15),
                        )
                            : GestureDetector(
                          onTap: () {
                            setState(() {
                              timerSeconds = 30;
                              startTimer();
                            });
                          },
                          child: const Text(
                            "Resend Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 38),

                  /// VERIFY BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: verifyOtp,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [darkBlue, lightBlue],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Homepage();
                            },));
                          },
                          child: const Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// OTP FIELD
  Widget otpBox(int index) {
    const Color darkBlue = Color(0xFF1D3557);

    return Container(
      margin: EdgeInsets.all(2),
      width: 43,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: darkBlue,
        ),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
