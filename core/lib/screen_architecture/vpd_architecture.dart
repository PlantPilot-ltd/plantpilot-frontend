part of '../core.dart';

/// ### VPDWidget
/// Class representing view for widget.
///
/// The main role of this class is to draw an UI.
mixin VPDScreenStateDelegate<S extends StatefulWidget> on State<S> {
  void updateView(VoidCallback onUpdate) {
    if (!mounted) return;
    setState(onUpdate);
  }
}

abstract class VPDScreenState<S extends StatefulWidget, P extends VPDPresenter>
    extends State<S> with VPDScreenStateDelegate<S> {
  late P presenter;

  void onScreenMove(Map<String, dynamic>? params) {}
  void onNavbarOpenedTap(Map<String, dynamic>? params) {}

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    presenter.initState();
  }

  @mustCallSuper
  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    presenter.view = this;
    return const _NullWidget();
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();
  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Widgets that mix BaseScreenStateDelegate into their State must '
      'call super.build() but must ignore the return value of the superclass.',
    );
  }
}

/// ### VPDPresenter
/// Class representing view's logic.
///
/// The main role of this class is to implement the logic associated with rendering
/// and tracking events caused by the UI.
///
/// This class may containt button's taps functions,
/// store such objects as ListController or TextEditController,
/// keep UI listeners and so on.
///
/// No buisness logic can be implemented here.
abstract class VPDPresenter<D extends VPDDataStore> {
  final D dataStore;
  late VPDScreenStateDelegate view;

  VPDPresenter({required this.dataStore});

  void initState() {}
  void dispose() {}
}

/// ### VPDDataStore
/// Mixin representing widget's business layer.
///
/// All logic corresponding to storing, processing, fetching data
/// have to be implemented here.
///
/// Also here you may store "state" variables. For example: `bool isLoading`.
abstract class VPDDataStore with Store {
  const VPDDataStore();

  void dispose() {}
}
