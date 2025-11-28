import 'package:flutter/material.dart';

class Offercomponet extends StatefulWidget {
  const Offercomponet({super.key});

  @override
  State<Offercomponet> createState() => _OffercomponetState();
}

class _OffercomponetState extends State<Offercomponet> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🎉 Special Offers',
                style: TextStyle(
                  fontSize: 20 * scale,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14 * scale,
                    color: const Color(0xFFC0C5CE),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        _buildSpecialOffers(context),
      ],
    );
  }

  Widget _buildSpecialOffers(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = MediaQuery.of(context).textScaleFactor;

    final List<Map<String, dynamic>> offers = [
      {
        'badge': 'NEW USER',
        'icon': '🎁',
        'discount': 'First Ride FREE',
        'desc': 'Up to ₹100 off on your first ride',
      },
      {
        'badge': '2ND RIDE',
        'icon': '🎊',
        'discount': '5% OFF',
        'desc': 'Get 5% off on your 2nd ride',
      },
      {
        'badge': '3RD RIDE',
        'icon': '🚀',
        'discount': '10% OFF',
        'desc': 'Enjoy 10% off on your 3rd ride',
      },
      {
        'badge': 'WEEKEND',
        'icon': '🎉',
        'discount': '15% OFF',
        'desc': 'Weekend rides up to ₹75 off',
      },
      {
        'badge': 'FLAT OFF',
        'icon': '💳',
        'discount': '₹50 OFF',
        'desc': 'On rides above ₹200',
      },
      {
        'badge': 'UPI PAYMENT',
        'icon': '💰',
        'discount': '20% OFF',
        'desc': 'Pay via UPI & save up to ₹100',
      },
    ];

    final List<Color> gradientColors = [
      const Color(0xFF1D3557),
      const Color(0xFF457B9D),
    ];

    return SizedBox(
      height: h * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        itemCount: offers.length,
        itemBuilder: (context, i) {
          final o = offers[i];

          return Container(
            width: w * 0.75, // responsive width
            margin: EdgeInsets.only(
              right: i < offers.length - 1 ? w * 0.04 : 0,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(w * 0.05),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge + Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03,
                          vertical: h * 0.006,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          o['badge'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11 * scale,
                          ),
                        ),
                      ),
                      Text(
                        o['icon'],
                        style: TextStyle(
                          fontSize: 32 * scale,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: h * 0.015),

                  // Discount text responsive
                  FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      o['discount'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.01),

                  // Description text
                  Text(
                    o['desc'],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14 * scale,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
