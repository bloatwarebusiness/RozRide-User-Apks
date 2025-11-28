import 'package:flutter/material.dart';
import 'package:nagola/Help/AppColor.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final List<Map<String, dynamic>> offers = [
    {
      'id': 'welcome',
      'title': 'Rozzride Welcome Offer',
      'tagline': 'First ride free up to ₹100!',
      'description': 'Install the app and enjoy your first ride.',
      'icon': '🎁',
      'code': 'WELCOME100',
      'type': 'New User',
      'value': '₹100 OFF',
    },
    {
      'id': 'gold-coins',
      'title': 'Ride & Earn Coins',
      'tagline': 'Every ride makes you richer!',
      'description': 'Earn Gold Coins: 100 coins = ₹50 discount',
      'icon': '🪙',
      'code': 'AUTO',
      'type': 'Loyalty',
      'value': 'Earn Coins',
    },
    {
      'id': 'spin-wheel',
      'title': 'Spin the Wheel',
      'tagline': 'Win free rides and rewards!',
      'description': 'Spin every 5 rides to win prizes.',
      'icon': '🎡',
      'code': 'SPIN5',
      'type': 'Gamification',
      'value': 'Win Prizes',
    },
  ];

  final List<Map<String, dynamic>> activeOffers = [
    {'title': '2 rides away from Spin Wheel', 'icon': '🎡', 'progress': 60},
    {'title': 'Gold Coins: 2,450', 'icon': '🪙', 'progress': 82},
    {'title': 'Refer 2 friends to earn ₹150', 'icon': '👥', 'progress': 40},
  ];

  // Colors
  final Color pageBackgroundColor = Color(0xff243E57);
  final Color cardBackgroundColor = Color(0xff1E3A57);
  final List<Color> offerCardGradientColors = [Color(0xFF1D3557), Color(0xFF457B9D)];
  final Color applyButtonColor = Color(0xFF00BFA6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            leading: Container(),
            expandedHeight: 120,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: offerCardGradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rozzride Offers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('🎁', style: TextStyle(fontSize: 26)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Save more, ride more, earn more!',
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



          // Offers List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final offer = offers[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cardBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gradient Header
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: offerCardGradientColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer['icon'] as String,
                                style: TextStyle(fontSize: 36),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      offer['type'] as String,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      offer['title'] as String,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  offer['value'] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer['tagline'] as String,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                offer['description'] as String,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Code:',
                                            style: TextStyle(fontSize: 12, color: Colors.white70),
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            offer['code'] as String,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Offer ${offer['title']} applied!')),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: applyButtonColor,
                                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 5,
                                    ),
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: offers.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
