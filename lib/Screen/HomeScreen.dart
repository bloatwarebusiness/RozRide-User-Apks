import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nagola/Componet/OfferComponet.dart';
import 'package:nagola/Componet/SuggestionsComponent.dart';
import '../Help/AppColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _dropController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff243E57),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SuggestionsComponent(),
                    _buildDiscoverRozzRide(),
                    const SizedBox(height: 16),
                    Offercomponet(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER (RESPONSIVE) ----------------
  Widget _buildHeader() {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = MediaQuery.of(context).textScaleFactor;

    return Material(
      color: AppColor.primary,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(w * 0.03),
          bottomRight: Radius.circular(w * 0.03),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: h * 0.015,
          bottom: h * 0.015,
          left: w * 0.04,
          right: w * 0.04,
        ),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                bool small = constraint.maxWidth < 360;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT SIDE (logo + tagline + profile)
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/logom.png",
                              width: w * 0.38,
                            ),
                            SizedBox(height: h * 0.005),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(
                                "Ride like Rozzride",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: (small ? 12 : 14) * scale,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/logo.jpg",
                            width: small ? 55 : 65,
                            height: small ? 55 : 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),

                    // RIGHT SIDE (icons)
                    Row(
                      children: [
                        _buildCircleButtonResponsive(Icons.card_giftcard),
                        SizedBox(width: w * 0.02),
                        _buildCircleButtonResponsive(
                          Icons.star,
                          color: Color(0xFFD4AF37),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: h * 0.018),

            _buildLocationInputs(),
          ],
        ),
      ),
    );
  }

  // ---------------- Responsive Icon Button ----------------
  Widget _buildCircleButtonResponsive(IconData icon, {Color? color}) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.10,
      height: w * 0.10,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color ?? Colors.white,
        size: w * 0.045,
      ),
    );
  }

  // ---------------- LOCATION INPUTS (RESPONSIVE) ----------------
  Widget _buildLocationInputs() {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(w * 0.04),
      child: _glassmorphicInput(
        controller: _dropController,
        hint: 'Where would you like to go?',
        icon: Icons.location_pin,
        color: Colors.greenAccent,
      ),
    );
  }

  Widget _glassmorphicInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required Color color,
  }) {
    final w = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(w * 0.04),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.04,
            vertical: w * 0.03,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(w * 0.04),
            border: Border.all(color: Colors.white.withOpacity(0.20)),
          ),
          child: Row(
            children: [
              Container(
                width: w * 0.035,
                height: w * 0.035,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: w * 0.03),

              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: w * 0.035,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              Icon(
                icon,
                color: Colors.white70,
                size: w * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- DISCOVER ROZZRIDE (RESPONSIVE) ----------------
  Widget _buildDiscoverRozzRide() {
    final width = MediaQuery.of(context).size.width;
    final bool isSmall = width < 360;

    final List<Map<String, dynamic>> features = [
      {
        'icon': '🚗',
        'title': 'Premium Rides',
        'desc': 'Luxury cars for comfort & style.',
        'colors': [Color(0xFF1D3557), Color(0xFF457B9D)],
      },
      {
        'icon': '🔒',
        'title': 'Safety First',
        'desc': 'Verified drivers & live tracking.',
        'colors': [Color(0xFF14532D), Color(0xFF166534)],
      },
      {
        'icon': '👨‍✈️',
        'title': 'Verified Drivers',
        'desc': 'Background-checked & trained drivers.',
        'colors': [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "✨ Discover RozzRide",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: isSmall ? 160 : 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
              EdgeInsets.symmetric(horizontal: isSmall ? 12 : 16),
              itemCount: features.length,
              itemBuilder: (context, i) {
                final f = features[i];
                return Container(
                  width: isSmall ? 220 : 300,
                  margin: EdgeInsets.only(
                    right: i < features.length - 1 ? 12 : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter:
                          ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: f['colors'] as List<Color>,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Colors.black.withOpacity(0.25),
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(
                                isSmall ? 14 : 20),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  f['icon'],
                                  style: TextStyle(
                                    fontSize:
                                    isSmall ? 38 : 48,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  f['title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    isSmall ? 16 : 18,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  f['desc'],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize:
                                    isSmall ? 12 : 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dropController.dispose();
    super.dispose();
  }
}
