import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nagola/Help/TermsAndPrivacy.dart';
import 'package:nagola/Page/OtpPage.dart';

class ProfessionalLoginPage extends StatefulWidget {
  const ProfessionalLoginPage({super.key});

  @override
  State<ProfessionalLoginPage> createState() => _ProfessionalLoginPageState();
}

class _ProfessionalLoginPageState extends State<ProfessionalLoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  late AnimationController _logoController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _logoController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    _scaleAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));

  }

  @override
  Widget build(BuildContext context) {
    const Color bgTop = Color(0xFF1D3557);
    const Color bgBottom = Color(0xFF457B9D);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          // BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [bgTop, bgBottom],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // CURVED TOP SHAPE
          Positioned(
            top: -130,
            left: -50,
            right: -50,
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(180),
              ),
            ),
          ),

          // MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // LOGO ANIMATION
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1D3557), Color(0xFF457B9D)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),

                      // 👇 Clip circle so image stays inside
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',      // Your logo file
                          fit: BoxFit.cover,      // Fill the circle nicely
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 25),

                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Enter your phone number to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // GLASS CARD
                  Container(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        // PHONE INPUT WITH WHITE COUNTRY CODE
                        Form(
                          key: formKey,
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {},
                            selectorConfig: const SelectorConfig(
                              selectorType:
                              PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            textFieldController: phoneController,
                            initialValue: number,

                            // WHITE TEXT
                            textStyle:  TextStyle(
                                color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                            selectorTextStyle: const TextStyle(
                                color: Colors.white, fontSize: 15),

                            inputDecoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.75)),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.15),
                              prefixIcon: const Icon(Icons.phone,
                                  color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),
                        Text(
                          "A verification code will be sent",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8), fontSize: 13),
                        ),

                        const SizedBox(height: 28),

                        // LOGIN BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OtpPage(
                                      phoneNumber: phoneController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF1D3557), Color(0xFF457B9D)],
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Login with Email",
                            style: TextStyle(
                              color: Color(0xFF00E0B8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 45),

                  Text(
                    "Fast, Safe & Reliable Rides",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TermsAndPrivacy(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
