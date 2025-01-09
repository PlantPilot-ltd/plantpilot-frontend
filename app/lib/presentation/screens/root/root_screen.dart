import 'package:flutter/material.dart';

import 'root_dependencies.dart';

class RootScreen extends StatelessWidget {
  final RootDependencies dependencies;
  const RootScreen({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dependencies.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: dependencies.navigationShell.currentIndex,
        onDestinationSelected: dependencies.navigationShell.goBranch,
        destinations: const [
          NavigationDestination(label: 'Controllers', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Profile', icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
