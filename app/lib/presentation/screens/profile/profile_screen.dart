import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'package:app/presentation/screens/profile/profile_presenter.dart';
import 'package:app/presentation/screens/profile/profile_store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends VPDScreenState<ProfileScreen, ProfilePresenter> {
  ProfileStore get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = ProfilePresenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(backgroundColor: Colors.green);
  }
}
