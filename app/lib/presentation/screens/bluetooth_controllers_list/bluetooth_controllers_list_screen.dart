import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_controllers_list_dependencies.dart';
import 'bluetooth_controllers_list_presenter.dart';
import 'bluetooth_controllers_list_store.dart';

class BluetoothControllersListScreen extends StatefulWidget {
  final BluetoothControllersListDependencies dependencies;
  const BluetoothControllersListScreen({super.key, required this.dependencies});
  @override
  _BluetoothControllersListScreenState createState() =>
      _BluetoothControllersListScreenState();
}

class _BluetoothControllersListScreenState extends VPDScreenState<
    BluetoothControllersListScreen, BluetoothControllersListPresenter> {
  BluetoothControllersListStore get dataStore => presenter.dataStore;
  BluetoothRepository get blRepo => presenter.dataStore.bluetoothRepository;

  @override
  void initState() {
    presenter = BluetoothControllersListPresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: presenter.onBackTap,
        ),
        title: const Text('Bluetooth devices'),
      ),
      body: Center(
        child: Observer(builder: (context) {
          if (dataStore.bluetoothRepository.bluetoothState ==
              BluetoothState.off) {
            return _BlTurnedOffView(onToSettingsTap: presenter.onToSettingsTap);
          }
          if (blRepo.scanResults.isEmpty &&
              blRepo.scanningState == BluetoothScanningState.scanning) {
            return _BlScanningView();
          }
          return Column(
            children: [
              Flexible(
                child: _BlBodyView(
                  scanResults: blRepo.scanResults,
                  deviceConnection: blRepo.deviceConnection,
                  onScanResultTap: presenter.onResultTap,
                  onStartScanTap: presenter.onStartScanTap,
                ),
              ),
              if (blRepo.scanningState == BluetoothScanningState.scanning)
                _BlScanningView(),
            ],
          );
        }),
      ),
    );
  }
}

class _BlTurnedOffView extends StatelessWidget {
  const _BlTurnedOffView({required this.onToSettingsTap});

  final VoidCallback onToSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Bluetooth is turned off'),
        SizedBox(height: 8),
        MaterialButton(
          child: Text('To Settings'),
          color: Colors.green,
          onPressed: onToSettingsTap,
        ),
      ],
    );
  }
}

class _BlScanningView extends StatelessWidget {
  const _BlScanningView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Scanning...'),
        SizedBox(height: 8),
        CircularProgressIndicator(),
      ],
    );
  }
}

class _BlBodyView extends StatelessWidget {
  const _BlBodyView({
    required this.scanResults,
    required this.deviceConnection,
    required this.onScanResultTap,
    required this.onStartScanTap,
  });

  final List<BluetoothScanResult> scanResults;
  final BluetoothConnection? deviceConnection;

  final void Function(BluetoothScanResult) onScanResultTap;
  final VoidCallback onStartScanTap;

  @override
  Widget build(BuildContext context) {
    if (scanResults.isEmpty) {
      return _BlEmptyView(onStartScanTap: onStartScanTap);
    }
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: scanResults
          .map((e) => BlScanResult(
                result: e,
                connected:
                    deviceConnection?.device.remoteId == e.device.remoteId,
                onTap: () => onScanResultTap(e),
              ))
          .toList(),
    );
  }
}

class _BlEmptyView extends StatelessWidget {
  const _BlEmptyView({required this.onStartScanTap});

  final VoidCallback onStartScanTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No devices found'),
        SizedBox(height: 8),
        MaterialButton(
          child: Text('Start scan'),
          color: Colors.green,
          onPressed: onStartScanTap,
        ),
      ],
    );
  }
}

class BlScanResult extends StatelessWidget {
  final BluetoothScanResult result;
  final bool connected;
  final VoidCallback onTap;

  const BlScanResult({
    super.key,
    required this.result,
    required this.connected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text('${result.rssi}'),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                result.device.advName,
                style: TextStyle(
                  color: connected ? Colors.green : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
