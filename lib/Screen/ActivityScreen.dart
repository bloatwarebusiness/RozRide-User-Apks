import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rides = [
      {
        'id': 1,
        'date': 'Today',
        'time': '2:30 PM',
        'from': 'Connaught Place',
        'to': 'Nehru Place',
        'vehicle': 'Bike – TVS', // Updated vehicle name
        'vehicleIcon': '🏍️',
        'fare': 120,
        'status': 'completed',
        'driver': 'Rohit Verma',
        'rating': 5,
        'distance': '7.2 km',
        'duration': '15 min',
        'coinsEarned': 12
      },
      {
        'id': 2,
        'date': 'Today',
        'time': '10:15 AM',
        'from': 'Saket Metro',
        'to': 'Greater Kailash',
        'vehicle': 'Car – Honda', // Updated vehicle name
        'vehicleIcon': '🚗',
        'fare': 250,
        'status': 'completed',
        'driver': 'Amit Singh',
        'rating': 5,
        'distance': '10.5 km',
        'duration': '22 min',
        'coinsEarned': 25
      },
      {
        'id': 3,
        'date': 'Yesterday',
        'time': '6:45 PM',
        'from': 'Cyber City',
        'to': 'DLF Phase 3',
        'vehicle': 'Auto Rickshaw – Bajaj', // Updated vehicle name
        'vehicleIcon': '🛺',
        'fare': 80,
        'status': 'completed',
        'driver': 'Vikram Patel',
        'rating': 4,
        'distance': '5.8 km',
        'duration': '18 min',
        'coinsEarned': 8
      }
    ];

    // ---------- CALCULATIONS ----------
    final totalRides = rides.length;
    final totalSpent = rides.fold<int>(0, (sum, r) => sum + (r['fare'] as int));
    final totalCoins = rides.fold<int>(0, (sum, r) => sum + (r['coinsEarned'] as int));
    final avgRating = (rides.fold<int>(0, (sum, r) => sum + (r['rating'] as int)) / rides.length)
        .toStringAsFixed(1);

    // ---------- UI COLORS ----------
    final Color pageBg = const Color(0xff243E57);
    final Color cardBg = const Color(0xff1E3A57);
    final List<Color> gradient = const [Color(0xFF1D3557), Color(0xFF457B9D)];

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
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Rides",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Track your complete ride history",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ---------------- STATS ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _statCard("Total Rides", "$totalRides", "📈")),
                      const SizedBox(width: 12),
                      Expanded(child: _statCard("Rating", avgRating, "⭐")),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _statCard("Total Spent", "₹$totalSpent", "💰")),
                      const SizedBox(width: 12),
                      Expanded(child: _statCard("Gold Coins", "$totalCoins", "🪙")),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ---------------- RIDE LIST ----------------
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final ride = rides[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // ---------------- HEADER ----------------
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xff2A4A6E),
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(18)),
                        ),
                        child: Row(
                          children: [
                            // Vehicle emoji
                            Text(
                              ride['vehicleIcon'],
                              style: const TextStyle(fontSize: 32),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "${ride['vehicle']} | ${ride['date']}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "₹${ride['fare']}",
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ---------------- BODY ----------------
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoRow("From", ride['from']),
                            _infoRow("To", ride['to']),
                            _infoRow("Driver", ride['driver']),
                            _infoRow("Distance", ride['distance']),
                            _infoRow("Duration", ride['duration']),
                            const SizedBox(height: 10),
                            Text(
                              "⭐ ${ride['rating']}  |  🪙 Earned: ${ride['coinsEarned']}",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // ---------------- BOOK AGAIN BUTTON ----------------
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Booking again from ${ride['from']} → ${ride['to']}",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: gradient),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    "Book Again",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: rides.length,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- STAT CARD ----------------
  Widget _statCard(String label, String value, String icon) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1E3A57),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 26)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- INFO ROW ----------------
  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              "$title:",
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
