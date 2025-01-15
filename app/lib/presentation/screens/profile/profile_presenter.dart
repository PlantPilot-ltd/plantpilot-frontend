import 'package:core_ui/core_ui.dart';

import 'package:app/presentation/screens/profile/profile_store.dart';

class ProfilePresenter extends VPDPresenter<ProfileStore> {
  ProfilePresenter() : super(dataStore: const ProfileStore());
}
