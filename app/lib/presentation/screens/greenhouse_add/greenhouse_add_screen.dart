import 'package:app/entities/index.dart';
import 'package:app/repositories/greenhouse/greenhouse_repository.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'greenhouse_add_dependencies.dart';
import 'greenhouse_add_presenter.dart';
import 'greenhouse_add_store.dart';

class GreenhouseAddScreen extends StatefulWidget {
  final GreenhouseAddDependencies dependencies;
  const GreenhouseAddScreen({super.key, required this.dependencies});
  @override
  _GreenhouseAddScreenState createState() => _GreenhouseAddScreenState();
}

class _GreenhouseAddScreenState
    extends VPDScreenState<GreenhouseAddScreen, GreenhouseAddPresenter> {
  GreenhouseAddStore get dataStore => presenter.dataStore;
  GreenhouseRepository get greenhouseRepository =>
      presenter.dataStore.greenhouseRepository;

  @override
  void initState() {
    presenter = GreenhouseAddPresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bluetooth Device: ${greenhouseRepository.connection.device.advName}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: presenter.onBackTap,
        ),
      ),
      body: Observer(builder: (context) {
        final connection = greenhouseRepository.connection;

        final connectedDeviceId = connection.device.remoteId;
        if (connectedDeviceId !=
            greenhouseRepository.connection.device.remoteId) {
          return _AnotherDeviceConnectedWidget();
        }

        if (connection.state == BluetoothConnectionStateEntity.disconnected) {
          return _NoConnectionWidget(onConnectTap: presenter.onConnectTap);
        }

        if (connection.state == BluetoothConnectionStateEntity.connecting) {
          return _ConnectingWidget(connection: connection);
        }

        return _ConnectedWidget(
          connection: connection,
          state: greenhouseRepository.state,
          onDisconnectTap: presenter.onDisconnectTap,
          onTurnOffTap: presenter.onTurnLEDOffTap,
          onTurnOnTap: presenter.onTurnLEDOnTap,
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
  final BluetoothConnectionEntity connection;
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
  final BluetoothConnectionEntity connection;
  final GreenhouseStateEntity state;
  final VoidCallback onDisconnectTap;
  final VoidCallback onTurnOnTap;
  final VoidCallback onTurnOffTap;

  const _ConnectedWidget({
    required this.connection,
    required this.state,
    required this.onDisconnectTap,
    required this.onTurnOnTap,
    required this.onTurnOffTap,
  });

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(child: Text('Data: ${state.data}')),
        ),
        SizedBox(height: 16),
        MaterialButton(
          child: Text('Turn On LED'),
          color: Colors.green,
          onPressed: onTurnOnTap,
        ),
        MaterialButton(
          child: Text('Turn Off LED'),
          color: Colors.red,
          onPressed: onTurnOffTap,
        ),
      ],
    );
  }
}
