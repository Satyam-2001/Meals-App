import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class _FilterSwitchListTile extends ConsumerWidget {
  const _FilterSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  final String title;
  final String subtitle;
  final Filter value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: ref.watch(filtersProvider)[value]!,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(value, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Column(
        children: [
          _FilterSwitchListTile(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            value: Filter.glutenFree,
          ),
          _FilterSwitchListTile(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            value: Filter.lactoseFree,
          ),
          _FilterSwitchListTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            value: Filter.vegetarian,
          ),
          _FilterSwitchListTile(
            title: 'vegan',
            subtitle: 'Only include vegan meals.',
            value: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
