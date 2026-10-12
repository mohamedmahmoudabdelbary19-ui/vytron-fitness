import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AddScreen extends StatelessWidget {
  final VoidCallback onAddFood;
  final VoidCallback onAddWater;
  final VoidCallback onStartWorkout;
  final VoidCallback onAddWeight;
  final VoidCallback onScanFood;

  const AddScreen({
    super.key,
    required this.onAddFood,
    required this.onAddWater,
    required this.onStartWorkout,
    required this.onAddWeight,
    required this.onScanFood,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'QUICK ACTIONS',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2),
        ),
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'MAKE IT COUNT.',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose what you want to record.',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 24),
          _action(context, Icons.restaurant, 'Log Food', onAddFood),
          _action(context, Icons.water_drop, 'Add Water', onAddWater),
          _action(
              context, Icons.fitness_center, 'Start Workout', onStartWorkout),
          _action(context, Icons.monitor_weight_outlined, 'Add Weight',
              onAddWeight),
          _action(context, Icons.document_scanner_outlined, 'Scan Food',
              onScanFood),
        ],
      ),
    );
  }

  Widget _action(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.neon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
