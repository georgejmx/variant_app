import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './index.dart';
import './adapters/settings_adapter.dart';
import './adapters/tasks_adapter.dart';
import './adapters/navigation_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsAdapter = SettingsAdapter();
  await settingsAdapter.loadSettings();

  final tasksAdapter = TasksAdapter();
  await tasksAdapter.loadDatabase();

  runApp(VariantApp(
    settingsAdapter: settingsAdapter,
    tasksAdapter: tasksAdapter,
  ));
}

class VariantApp extends StatelessWidget {
  final appName = 'Variant App';
  const VariantApp({
    super.key,
    required this.settingsAdapter,
    required this.tasksAdapter,
  });

  final SettingsAdapter settingsAdapter;
  final TasksAdapter tasksAdapter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingsAdapter,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: appName,
            restorationScopeId: appName,
            theme: settingsAdapter.lightTheme,
            darkTheme: settingsAdapter.darkTheme,
            themeMode: settingsAdapter.themeMode,
            home: ChangeNotifierProvider<NavigationAdapter>(
                create: (context) => NavigationAdapter(),
                child: VariantLayout(
                  settingsAdapter: settingsAdapter,
                  tasksAdapter: tasksAdapter,
                  appName: appName,
                )),
          );
        });
  }
}
