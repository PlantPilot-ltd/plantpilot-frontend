import 'package:core_ui/core_ui.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore extends VPDDataStore with Store {
  const _ProfileStore();
}
