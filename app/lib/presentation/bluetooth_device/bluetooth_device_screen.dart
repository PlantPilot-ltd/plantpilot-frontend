import 'dart:convert';
import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_core/ui_core.dart';

import 'bluetooth_device_dependencies.dart';
import 'bluetooth_device_presenter.dart';

class BluetoothDeviceScreen extends StatefulWidget {
  final BluetoothDeviceDependencies dependencies;
  const BluetoothDeviceScreen({super.key, required this.dependencies});
  @override
  _BluetoothDeviceScreenState createState() => _BluetoothDeviceScreenState();
}

class _BluetoothDeviceScreenState
    extends VPDScreenState<BluetoothDeviceScreen, BluetoothDevicePresenter> {
  BluetoothRepository get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = BluetoothDevicePresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Device: ${widget.dependencies.device.advName}'),
      ),
      body: Observer(builder: (context) {
        final connection = dataStore.deviceConnection;

        final connectedDeviceId = connection?.device.remoteId;
        if (connectedDeviceId != null &&
            connectedDeviceId != widget.dependencies.device.remoteId) {
          return _AnotherDeviceConnectedWidget();
        }

        if (connection == null ||
            connection.state == BluetoothConnectionState.disconnected) {
          return _NoConnectionWidget(onConnectTap: presenter.onConnectTap);
        }

        if (connection.state == BluetoothConnectionState.connecting) {
          return _ConnectingWidget(connection: connection);
        }

        return _ConnectedWidget(
          connection: connection,
          data: dataStore.deviceConnectionData,
          onDisconnectTap: presenter.onDisconnectTap,
          onSendDataTap: presenter.onSendDataTap,
        );
      }),
    );
  }
}

class _AnotherDeviceConnectedWidget extends StatelessWidget {
  const _AnotherDeviceConnectedWidget();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Connected to another device'));
  }
}

class _ConnectingWidget extends StatelessWidget {
  final BluetoothConnection connection;
  const _ConnectingWidget({required this.connection});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Device name: ${connection.device.advName}'),
          CircularProgressIndicator(),
          SizedBox(height: 8),
          Text('Connecting to device...'),
        ],
      ),
    );
  }
}

class _NoConnectionWidget extends StatelessWidget {
  final VoidCallback onConnectTap;
  const _NoConnectionWidget({required this.onConnectTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Device is not connected'),
          SizedBox(height: 8),
          MaterialButton(
            child: Text('Connect'),
            color: Colors.green,
            onPressed: onConnectTap,
          ),
        ],
      ),
    );
  }
}

class _ConnectedWidget extends StatelessWidget {
  final BluetoothConnection connection;
  final BluetoothData? data;
  final VoidCallback onDisconnectTap;
  final VoidCallback onSendDataTap;

  const _ConnectedWidget({
    required this.connection,
    required this.data,
    required this.onDisconnectTap,
    required this.onSendDataTap,
  });

  @override
  Widget build(BuildContext context) {
    final decodedData = data == null ? null : utf8.decode(data!.data);
    return ListView(
      children: [
        MaterialButton(
          child: Text('Disconnect'),
          color: Colors.red,
          onPressed: onDisconnectTap,
        ),
        SizedBox(height: 16),
        Text('Device info:'),
        Text('Name: ${connection.device.advName}'),
        Text('Id: ${connection.device.remoteId}'),
        Text('Status: ${connection.state.toString()}'),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
              child: Text('Data: ${decodedData.toString()}')),
        ),
        SizedBox(height: 16),
        MaterialButton(
          child: Text('Send randomData'),
          color: Colors.red,
          onPressed: onSendDataTap,
        ),
      ],
    );
  }
}
