import 'package:flutter/material.dart';
import 'package:nagola/Componet/OfferComponet.dart';
import 'package:nagola/Componet/SuggestionsComponent.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // Colors
  final Color pageBg = const Color(0xFF1D3557);
  final Color cardBg = const Color(0xFF243E57);
  final Color headerBg = const Color(0xFF2A4A6E);
  final Color accentColor = const Color(0xFF27E1C1);
  final List<Color> gradientColors = [Color(0xFF1D3557), Color(0xFF457B9D)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: CustomScrollView(
        slivers: [
          // ---------------- HEADER ----------------
          SliverAppBar(
            leading: Container(),
            expandedHeight: 120,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Go anywhere, get anything',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ---------------- SUGGESTIONS COMPONENT ----------------
          SliverToBoxAdapter(
            child: SuggestionsComponent(key: UniqueKey()),
          ),

          // ---------------- OFFERS COMPONENT ----------------
          SliverToBoxAdapter(
            child:  Offercomponet(key: UniqueKey()),
          ),

          // ---------------- SPACING ----------------
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}
