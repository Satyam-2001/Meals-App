import 'package:flutter/material.dart';

class _MainDrawerHeader extends StatelessWidget {
  const _MainDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.fastfood,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 18),
          Text(
            'Cooking Up!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}

class _MainDrawerListTile extends StatelessWidget {
  const _MainDrawerListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: onTap,
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSetScreen,
  });

  final void Function(String identifier) onSetScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const _MainDrawerHeader(),
          _MainDrawerListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () => onSetScreen('meals'),
          ),
          _MainDrawerListTile(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () => onSetScreen('filters'),
          ),
        ],
      ),
    );
  }
}
