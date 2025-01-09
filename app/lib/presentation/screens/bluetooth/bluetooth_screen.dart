import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_dependencies.dart';
import 'bluetooth_presenter.dart';

class BluetoothScreen extends StatefulWidget {
  final BluetoothDependencies dependencies;
  const BluetoothScreen({super.key, required this.dependencies});

  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState
    extends VPDScreenState<BluetoothScreen, BluetoothPresenter> {
  BluetoothRepository get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = BluetoothPresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Bluetooth devices')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            /// Bluetooth status
            Observer(
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Bluetooth status: ${dataStore.bluetoothState}',
                      ),
                    ),
                    if (dataStore.bluetoothState == BluetoothState.off)
                      MaterialButton(
                        child: Text('Turn on'),
                        color: Colors.green,
                        onPressed: dataStore.tryTurnOnBluetooth,
                      ),
                  ],
                ),
              ),
            ),

            /// Scan status
            Observer(
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Scan status: ${dataStore.scanningState}'),
                    ),
                    switch (dataStore.scanningState) {
                      (BluetoothScanningState.idle) => MaterialButton(
                          child: Text('Scan'),
                          color: Colors.green,
                          onPressed: dataStore.startScanningForDevices,
                        ),
                      (BluetoothScanningState.scanning) => MaterialButton(
                          child: Text('Stop'),
                          color: Colors.red,
                          onPressed: dataStore.stopScanningForDevices,
                        ),
                    },
                  ],
                ),
              ),
            ),

            /// Scan results
            Expanded(
              child: Observer(builder: (context) {
                if (dataStore.scanResults.isEmpty) {
                  return const Center(child: Text('No devices found'));
                }
                return ListView(
                  children: dataStore.scanResults
                      .map((e) => BlScanResult(
                            result: e,
                            connected:
                                dataStore.deviceConnection?.device.remoteId ==
                                    e.device.remoteId,
                            onTap: () => presenter.onResultTap(e),
                          ))
                      .toList(),
                );
              }),
            ),
          ],
        ),
      ),
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
