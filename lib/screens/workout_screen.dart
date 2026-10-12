import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkoutScreen extends StatelessWidget {
  final VoidCallback onStartWorkout;

  const WorkoutScreen({
    super.key,
    required this.onStartWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'WORKOUTS',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
        ),
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'BUILD YOUR ROUTINE',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose a sample program and adapt it to your needs.',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 22),
          _program(
            context,
            'FULL BODY',
            'Sample program • Full-body session',
            Icons.accessibility_new_rounded,
            onStartWorkout,
          ),
          _program(
            context,
            'UPPER / LOWER',
            'Sample program • Split routine',
            Icons.fitness_center_rounded,
            onStartWorkout,
          ),
          _program(
            context,
            'PUSH / PULL / LEGS',
            'Sample program • Three training groups',
            Icons.bolt_rounded,
            onStartWorkout,
          ),
          _program(
            context,
            'BEGINNER',
            'Sample program • Start at your own pace',
            Icons.flag_outlined,
            onStartWorkout,
          ),
          const SizedBox(height: 14),
          const Text(
            'These are starting points, not personalized medical or training advice.',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _program(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
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
        contentPadding: const EdgeInsets.all(14),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.neon.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: AppColors.neon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            subtitle,
            style: const TextStyle(color: AppColors.secondaryText),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.neon),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            backgroundColor: AppColors.card,
            showDragHandle: true,
            builder: (sheetContext) => Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a starter program template. Exercises and workout history will be added in the next development phase.',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        onTap();
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('START SESSION'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.neon,
                        foregroundColor: AppColors.background,
                      ),
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
