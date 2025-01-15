import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/presentation/screens/greenhouses_bluetooth_list/greenhouses_bluetooth_list_presenter.dart';
import 'package:app/presentation/screens/greenhouses_bluetooth_list/greenhouses_bluetooth_list_store.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class GreenhousesBluetoothListScreen extends StatefulWidget {
  final GreenhousesBluetoothListDependencies dependencies;
  const GreenhousesBluetoothListScreen({super.key, required this.dependencies});
  @override
  _GreenhousesBluetoothListScreenState createState() =>
      _GreenhousesBluetoothListScreenState();
}

class _GreenhousesBluetoothListScreenState extends VPDScreenState<
    GreenhousesBluetoothListScreen, GreenhousesBluetoothListPresenter> {
  GreenhousesBluetoothListStore get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = GreenhousesBluetoothListPresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: CoreUiAppBar(
        title: context.localization.blDevicesListTitle,
        leading: CoreUiIconButton.appBar(
          icon: CoreUIIcons.chevronBackwards,
          onTap: presenter.onBackTap,
        ),
      ),
      body: Observer(
        builder: (context) {
          if (dataStore.bluetoothState == BluetoothStateEntity.off) {
            return _BlTurnedOffView(onToSettingsTap: presenter.onToSettingsTap);
          }
          if (dataStore.lastScanResults.isEmpty &&
              dataStore.scanningState ==
                  BluetoothScanningStateEntity.scanning) {
            return const _BlScanningView.big();
          }
          return _BlBodyView(
            scanningState: dataStore.scanningState,
            scanResults: dataStore.lastScanResults,
            onScanResultTap: presenter.onResultTap,
          );
        },
      ),
    );
  }
}

class _BlTurnedOffView extends StatelessWidget {
  const _BlTurnedOffView({required this.onToSettingsTap});

  final VoidCallback onToSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(CoreUIIcons.bluetooth, size: 27),
              const SizedBox(width: 12),
              Text(
                context.localization.blDevicesListTurnedOffTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: CoreUIColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            context.localization.blDevicesListTurnedOffDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CoreUIColors.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          CoreUiSmallButton.outlined(
            title: context.localization.blDevicesListTurnedOffSettings,
            onTap: onToSettingsTap,
          ),
        ],
      ),
    );
  }
}

class _BlScanningView extends StatelessWidget {
  final double _sizeMult;

  const _BlScanningView.small() : _sizeMult = 0.2;
  const _BlScanningView.big() : _sizeMult = 0.6;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).shortestSide * _sizeMult;
    return Center(child: LeavesLoading(size: size));
  }
}

class _BlBodyView extends StatelessWidget {
  const _BlBodyView({
    required this.scanningState,
    required this.scanResults,
    required this.onScanResultTap,
  });

  final BluetoothScanningStateEntity? scanningState;
  final List<BluetoothScanResultEntity> scanResults;

  final void Function(BluetoothScanResultEntity) onScanResultTap;

  @override
  Widget build(BuildContext context) {
    if (scanResults.isEmpty) {
      return const _BlEmptyView();
    }
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        ...scanResults.map(
          (e) => _BlScanResult(
            result: e,
            connected: false,
            onTap: () => onScanResultTap(e),
          ),
        ),
        if (scanningState == BluetoothScanningStateEntity.scanning)
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: _BlScanningView.small(),
          ),
      ],
    );
  }
}

class _BlEmptyView extends StatelessWidget {
  const _BlEmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.blDevicesListEmptyTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CoreUIColors.text,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            context.localization.blDevicesListEmptyDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CoreUIColors.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlScanResult extends StatelessWidget {
  final BluetoothScanResultEntity result;
  final bool connected;
  final VoidCallback onTap;

  const _BlScanResult({
    required this.result,
    required this.connected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: CoreUIColors.secondaryBackground,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 216,
              child: Column(
                children: [
                  /// Top block
                  Expanded(
                    child: Stack(
                      children: [
                        /// Image
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 12,
                          child: Image.asset(
                            AppImages.greenhousePlaceholder,
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            fit: BoxFit.contain,
                          ),
                        ),

                        Positioned(
                          left: 24,
                          bottom: 0,
                          child: Row(
                            children: [
                              CoreUiSmallInfoBlock.bluetoothSignal(
                                signalRssi: result.rssi.abs(),
                              ),
                              const SizedBox(width: 12),
                              const CoreUiSmallInfoBlock.bluetooth(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        /// Device name
                        Expanded(
                          child: Text(
                            result.device.advName,
                            style: const TextStyle(
                              color: CoreUIColors.text,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          CoreUIIcons.chevronForward,
                          size: 24,
                          color: CoreUIColors.text,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
