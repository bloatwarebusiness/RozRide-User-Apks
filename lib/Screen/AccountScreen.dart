import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String userGender = 'male'; // 'male' or 'female'
  final int karmaScore = 980;
  final int goldCoins = 2450;

  @override
  Widget build(BuildContext context) {
    // Theme colors like ActivityScreen
    final Color pageBg = const Color(0xFF243E57);
    final Color cardBg = const Color(0xFF1E3A57);
    final Color headerBg = const Color(0xFF2A4A6E);
    final Color accentColor = const Color(0xFF27E1C1);

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
                  color: headerBg,
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
                      children: [
                        const Text(
                          "My Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Manage your profile & rewards",
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

          // ---------------- STATS CARDS ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double cardWidth = (constraints.maxWidth - 12) / 2;
                  return Row(
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _statCard(
                            "Gold Coins", "$goldCoins", "🪙", cardBg, accentColor),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: cardWidth,
                        child: _statCard(
                            "Karma Points", "$karmaScore", "🏆", cardBg, accentColor),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // ---------------- PROFILE CARD ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: headerBg,
                          shape: BoxShape.circle,
                          border: Border.all(color: accentColor, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            userGender == 'male' ? '👨' : '👩',
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Viraj Patel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '+91 98765 43210',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ---------------- GENDER PREFERENCE ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rozzride Treatment Preference",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _genderOption("Male", "👨", "Sir", "male"),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _genderOption("Female", "👩", "Ma'am", "female"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ---------------- MENU SECTIONS ----------------
          _buildMenuSection(
            "Rewards & Offers",
            [
              _MenuItem(icon: Icons.card_giftcard, title: "Redeem Coins"),
              _MenuItem(icon: Icons.star, title: "My Coupons"),
              _MenuItem(icon: Icons.emoji_events, title: "Referral Program"),
            ],
            cardBg,
          ),
          _buildMenuSection(
            "Payment & Wallet",
            [
              _MenuItem(icon: Icons.credit_card, title: "Payment Methods"),
              _MenuItem(icon: Icons.account_balance_wallet, title: "Rozzride Wallet"),
            ],
            cardBg,
          ),
          _buildMenuSection(
            "Support & More",
            [
              _MenuItem(icon: Icons.help_outline, title: "Help & Support"),
              _MenuItem(icon: Icons.favorite, title: "Rate Us"),
            ],
            cardBg,
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }

  // ---------------- WIDGET HELPERS ----------------
  Widget _statCard(String label, String value, String icon, Color bg, Color accent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelBox(String text, String emoji, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(text,
              style: const TextStyle(fontSize: 10, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _genderOption(String title, String emoji, String subtitle, String gender) {
    final bool isActive = userGender == gender;
    final Color cardBg = const Color(0xFF1E3A57);
    final Color accent = const Color(0xFF27E1C1);

    return GestureDetector(
      onTap: () {
        setState(() {
          userGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          border: Border.all(color: isActive ? accent : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, List<_MenuItem> items, Color bg) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6))
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 14)),
                ),
              ),
              const Divider(color: Colors.white24, height: 1),
              ...items.map((item) => _buildMenuItem(item)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(_MenuItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(item.icon, color: Colors.white70),
            const SizedBox(width: 12),
            Text(item.title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _MenuItem({required this.icon, required this.title, this.onTap = defaultFunc});

  static void defaultFunc() {}
}
