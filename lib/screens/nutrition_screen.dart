import 'package:flutter/material.dart';
import '../theme/colors.dart';

class NutritionScreen extends StatelessWidget {
  final VoidCallback onAddFood;
  final VoidCallback onScanFood;

  const NutritionScreen({
    super.key,
    required this.onAddFood,
    required this.onScanFood,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'NUTRITION',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
        ),
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'FUEL YOUR PROGRESS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your food log starts when you add your first meal.',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 22),
          _nutritionCard(
            icon: Icons.restaurant_rounded,
            title: 'FOOD LOG',
            description: 'Record meals and review nutrition information.',
            action: 'ADD FOOD',
            onTap: onAddFood,
          ),
          _nutritionCard(
            icon: Icons.document_scanner_outlined,
            title: 'AI FOOD SCANNER',
            description:
                'Prepare a food analysis request. An external analysis service is not connected yet.',
            action: 'OPEN SCANNER',
            onTap: onScanFood,
          ),
          const SizedBox(height: 14),
          const Text(
            'No calorie or nutrient totals are calculated until food entries are implemented.',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _nutritionCard({
    required IconData icon,
    required String title,
    required String description,
    required String action,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.neon, size: 30),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton(
            onPressed: onTap,
            child: Text(action),
          ),
        ],
      ),
    );
  }
}
