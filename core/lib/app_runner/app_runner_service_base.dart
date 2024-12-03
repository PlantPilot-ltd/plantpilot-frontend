part of '../core.dart';

enum AppInitStatus { idle, initialized, error }

/// This class implements app running logic.
/// Class extends [WidgetsBindingObserver]
/// so you can implement Lifecycle Event Handling right inside.
abstract class AppRunnerServiceBase extends WidgetsBindingObserver {
  /// Is application initialized
  late final Computed<bool> initialized = Computed<bool>(
    () => _initialized.value,
  );
  final Observable<bool> _initialized = Observable<bool>(false);

  /// Exception on initialization
  late final Computed<Object?> initException = Computed<Object?>(
    () => _initException.value,
  );
  final Observable<Object?> _initException = Observable<Object?>(null);

  /// Status of app initialization
  late final Computed<AppInitStatus> status = Computed<AppInitStatus>(() {
    if (initException.value != null) return AppInitStatus.error;
    if (initialized.value) return AppInitStatus.initialized;
    return AppInitStatus.idle;
  });

  /// Run application and perform initialization.
  ///
  /// First of all it runs and wait for [beforeRun] execution.
  /// At this moment flutter is not running.
  ///
  /// Then method calls [runApp].
  /// At this moment [splash] becomes visible.
  ///
  /// Finally it calls [afterRun] function.
  /// In case there is no exception from [afterRun] then [app]widget becomes visible.
  /// If there is an error then [error] widget is being displayed.
  @mustCallSuper
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addObserver(this);
    await beforeRun();
    runApp(
      AppRunnerWidget(
        app: buildAppWidget,
        splash: buildSplashWidget,
        error: buildErrorWidget,
        appRunnerService: this,
      ),
    );
    final exception = await afterRun();

    runInAction(
      () {
        transaction(() {
          _initException.value = exception;
        });
        _initialized.value = true;
      },
    );
  }

  /// Runs before [runApp] function.
  ///
  /// This is the best place to run [WidgetsFlutterBinding.ensureInitialized()].
  /// Or initialize Firebase, for example.
  @protected
  Future<void> beforeRun();

  /// Runs right after [runApp].
  ///
  /// Response from this function perceive as initialization exception.
  ///
  /// So in case this function returns something then
  /// AppRunnerServiceBase would thing there is an Exception and
  /// display [error] widget from [run] function.
  ///
  /// Othervise it displays [app] widget.
  @protected
  Future<Object?> afterRun();

  @protected
  Widget buildAppWidget(BuildContext context);
  @protected
  Widget buildSplashWidget(BuildContext context);
  @protected
  Widget buildErrorWidget(BuildContext context);
}
