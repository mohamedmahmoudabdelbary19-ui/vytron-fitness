import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'screens/add_screen.dart';
import 'screens/home_screen.dart';
import 'screens/nutrition_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/workout_screen.dart';
import 'theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VytronApp());
}

class VytronApp extends StatelessWidget {
  const VytronApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.neon,
          secondary: AppColors.electricGreen,
          surface: AppColors.card,
          onPrimary: AppColors.background,
          onSurface: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.white,
          centerTitle: false,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBackground,
          indicatorColor: AppColors.neon.withValues(alpha: 0.14),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            return TextStyle(
              fontSize: 11,
              fontWeight: states.contains(WidgetState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: states.contains(WidgetState.selected)
                  ? AppColors.neon
                  : AppColors.secondaryText,
            );
          }),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  void _message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: AppColors.card,
      ),
    );
  }

  void _startWorkout() {
    setState(() => selectedIndex = 1);
  }

  void _addFood() {
    setState(() => selectedIndex = 3);
    _message('Food logging screen selected. Meal entry will be added next.');
  }

  void _scanFood() {
    setState(() => selectedIndex = 3);
    _message(
        'Food scanner selected. Connect an analysis service in a later phase.');
  }

  void _openQuickAction(String action) {
    switch (action) {
      case 'Log Food':
        _addFood();
      case 'Add Water':
        _message('Water logging will be implemented in the activity phase.');
      case 'Start Workout':
        _startWorkout();
      case 'Add Weight':
        _message('Weight history will be implemented in the progress phase.');
      case 'Scan Food':
        _scanFood();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        onStartWorkout: _startWorkout,
        onScanFood: _scanFood,
        onAddFood: _addFood,
        onViewProgress: () =>
            _message('Progress reports will be added in a later phase.'),
      ),
      WorkoutScreen(onStartWorkout: _startWorkout),
      AddScreen(
        onAddFood: () => _openQuickAction('Log Food'),
        onAddWater: () => _openQuickAction('Add Water'),
        onStartWorkout: () => _openQuickAction('Start Workout'),
        onAddWeight: () => _openQuickAction('Add Weight'),
        onScanFood: () => _openQuickAction('Scan Food'),
      ),
      NutritionScreen(
        onAddFood: _addFood,
        onScanFood: _scanFood,
      ),
      const ShopScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: AppColors.neon),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center, color: AppColors.neon),
            label: 'Workouts',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline, size: 29),
            selectedIcon:
                Icon(Icons.add_circle, color: AppColors.neon, size: 29),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_outlined),
            selectedIcon: Icon(Icons.restaurant, color: AppColors.neon),
            label: 'Nutrition',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag, color: AppColors.neon),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}
