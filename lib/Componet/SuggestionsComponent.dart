import 'dart:ui';
import 'package:flutter/material.dart';

class SuggestionsComponent extends StatefulWidget {
  const SuggestionsComponent({super.key});

  @override
  State<SuggestionsComponent> createState() => _SuggestionsComponentState();
}

class _SuggestionsComponentState extends State<SuggestionsComponent> {
  final List<Map<String, dynamic>> suggestions = [
    {'icon': '🚗', 'label': 'Cab', 'badge': '15%'},
    {'icon': '🛺', 'label': 'Auto', 'badge': null},
    {'icon': '🏍️', 'label': 'Moto', 'badge': null},
    {'icon': '🚇', 'label': 'Metro tickets', 'badge': 'Promo'},
    {'icon': '📦', 'label': 'Send items', 'badge': null},
    {'icon': '🏙️', 'label': 'Delhi NCR', 'badge': 'Hot'}, // new item added
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Suggestions",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: suggestions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, i) {
              final s = suggestions[i];
              return GlassmorphicCard(
                icon: s['icon'] as String,
                label: s['label'] as String,
                badge: s['badge'] as String?,
              );
            },
          ),
        ],
      ),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final String icon;
  final String label;
  final String? badge;

  const GlassmorphicCard({
    super.key,
    required this.icon,
    required this.label,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // Background blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(icon, style: const TextStyle(fontSize: 28)),
                const SizedBox(height: 8),
                Text(label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          // Optional badge
          if (badge != null)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
