import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/activity_circle.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onStartWorkout;
  final VoidCallback onScanFood;
  final VoidCallback onAddFood;
  final VoidCallback onViewProgress;

  const HomeScreen({
    super.key,
    required this.onStartWorkout,
    required this.onScanFood,
    required this.onAddFood,
    required this.onViewProgress,
  });

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'GOOD MORNING';
    if (hour < 17) return 'GOOD AFTERNOON';
    return 'GOOD EVENING';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.neon,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.bolt,
                    color: AppColors.background,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VYTRON',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.5,
                        ),
                      ),
                      Text(
                        'TRAIN SMART. LIVE STRONG.',
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 9,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Notifications',
                  onPressed: () => _message(context, 'Notifications'),
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
                IconButton(
                  tooltip: 'Profile',
                  onPressed: () => _message(context, 'Profile'),
                  icon: const Icon(Icons.account_circle_outlined),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              greeting,
              style: const TextStyle(
                color: AppColors.neon,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "LET'S GET STRONGER.",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Small steps. Strong habits. Your pace.',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 24),
            _heroCard(context),
            const SizedBox(height: 28),
            _sectionHeader(
              'TODAY AT A GLANCE',
              'Your daily activity',
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ProgressCard(
                    title: 'Calories',
                    value: '0 kcal',
                    subtitle: 'Daily target not set',
                    icon: Icons.local_fire_department_rounded,
                    progress: 0,
                    onTap: onAddFood,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ProgressCard(
                    title: 'Water',
                    value: '0 ml',
                    subtitle: 'Tap to log water',
                    icon: Icons.water_drop_rounded,
                    accent: const Color(0xFF61B8FF),
                    progress: 0,
                    onTap: () => _message(context, 'Water logging'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ProgressCard(
              title: 'Steps',
              value: 'Not connected',
              subtitle:
                  'Connect a supported health data source to track steps.',
              icon: Icons.directions_walk_rounded,
              progress: 0,
              onTap: () => _message(
                context,
                'Step tracking needs a compatible health data source.',
              ),
            ),
            const SizedBox(height: 28),
            _sectionHeader('YOUR PROGRESS', 'View reports'),
            const SizedBox(height: 14),
            Material(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(22),
              child: InkWell(
                onTap: onViewProgress,
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WEEKLY ACTIVITY',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Build your streak',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Your workout history will appear here.',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const ActivityCircle(
                        progress: 0,
                        value: '0/7',
                        label: 'DAYS',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            _sectionHeader('SMART FEATURES', 'Explore'),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _featureCard(
                    context,
                    icon: Icons.document_scanner_outlined,
                    title: 'AI FOOD SCANNER',
                    subtitle: 'Analyze meals',
                    onTap: onScanFood,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _featureCard(
                    context,
                    icon: Icons.psychology_outlined,
                    title: 'WORKOUT ASSISTANT',
                    subtitle: 'Explore training',
                    onTap: onStartWorkout,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionHeader('YOUR NEXT MOVE', 'Start now'),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: AppColors.neon.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.fitness_center_rounded,
                      color: AppColors.neon,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'READY WHEN YOU ARE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Choose a workout to get started.',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onStartWorkout,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.neon,
                      foregroundColor: AppColors.background,
                    ),
                    icon: const Icon(Icons.play_arrow_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'VYTRON • TRAIN SMART. LIVE STRONG.',
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 9,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF202B18),
            Color(0xFF121712),
            Color(0xFF101310),
          ],
        ),
        border: Border.all(color: AppColors.neon.withValues(alpha: 0.3)),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -8,
            top: 0,
            child: Icon(
              Icons.fitness_center_rounded,
              size: 104,
              color: Color(0xFF343F2D),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.neon.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'YOUR FITNESS JOURNEY',
                  style: TextStyle(
                    color: AppColors.neon,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const SizedBox(
                width: 230,
                child: Text(
                  'MOVE WITH PURPOSE.',
                  style: TextStyle(
                    fontSize: 27,
                    height: 1.15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                width: 230,
                child: Text(
                  'Your next level starts with one session.',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              FilledButton.icon(
                onPressed: onStartWorkout,
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('START WORKOUT'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.neon,
                  foregroundColor: AppColors.background,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String action) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              letterSpacing: 0.6,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: AppColors.secondaryText,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _featureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.neon, size: 27),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _message(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.card,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
