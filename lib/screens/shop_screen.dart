import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'VYTRON SHOP',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
        ),
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            tooltip: 'Cart',
            onPressed: () => _showMessage(
                context, 'Cart will be implemented in the shop phase.'),
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'YOUR FITNESS ESSENTIALS',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore the future shop layout.',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 22),
          const _ShopCategory(
            icon: Icons.fitness_center,
            title: 'Training Gear',
            description: 'Equipment and workout accessories',
          ),
          const _ShopCategory(
            icon: Icons.local_drink_outlined,
            title: 'Hydration',
            description: 'Bottles and hydration accessories',
          ),
          const _ShopCategory(
            icon: Icons.shopping_bag_outlined,
            title: 'All Products',
            description: 'Product catalog will be connected later',
          ),
          const SizedBox(height: 16),
          const Text(
            'No real products, prices, or inventory are configured yet.',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 11),
          ),
        ],
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.card,
      ),
    );
  }
}

class _ShopCategory extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ShopCategory({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: Icon(icon, color: AppColors.neon, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            description,
            style: const TextStyle(color: AppColors.secondaryText),
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Product catalog is not connected yet.')),
          );
        },
      ),
    );
  }
}
