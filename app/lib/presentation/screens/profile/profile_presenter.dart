import 'package:core_ui/core_ui.dart';

import 'profile_store.dart';

class ProfilePresenter extends VPDPresenter<ProfileStore> {
  ProfilePresenter() : super(dataStore: ProfileStore());
}
