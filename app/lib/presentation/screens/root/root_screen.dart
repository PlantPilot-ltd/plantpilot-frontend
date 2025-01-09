import 'package:app/presentation/index.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  final RootDependencies dependencies;
  const RootScreen({super.key, required this.dependencies});

  void _onAddTap() {
    dependencies.router.router.goBluetoothControllersList();
  }

  void _onItemTap(int index) {
    dependencies.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dependencies.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddTap,
        child: const Icon(Icons.add, size: 28),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: dependencies.navigationShell.currentIndex,
        onDestinationSelected: _onItemTap,
        destinations: const [
          NavigationDestination(label: 'Controllers', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
