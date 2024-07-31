import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './fragments/create.dart';
import './fragments/home.dart';
import './adapters/navigation_adapter.dart';
import './adapters/settings_adapter.dart';
import './adapters/tasks_adapter.dart';

class VariantLayout extends StatelessWidget {
  const VariantLayout({
    super.key,
    required this.settingsAdapter,
    required this.tasksAdapter,
    required this.appName,
  });

  final SettingsAdapter settingsAdapter;
  final TasksAdapter tasksAdapter;
  final String appName;

  Widget getCurrentFragment(AppFragment currentFragment) {
    switch (currentFragment) {
      case AppFragment.home:
        return HomeFragment(tasksAdapter: tasksAdapter);
      case AppFragment.create:
        return CreateFragment(tasksAdapter: tasksAdapter);
      default:
        throw UnimplementedError('invalid fragment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          );
        }),
      ),
      body: Row(
        // covers the whole screen
        children: [
          Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: getCurrentFragment(
                    Provider.of<NavigationAdapter>(context).selectedFragment)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            const SizedBox(height: 20.0),
            SwitchListTile(
                title: const Text("Dark Mode"),
                value: settingsAdapter.themeMode == ThemeMode.dark,
                activeColor: Colors.grey[800],
                onChanged: (bool _) {
                  settingsAdapter.toggleTheme();
                })
          ],
        ),
      ),
    );
  }
}
