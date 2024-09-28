// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BluetoothRepository on _BluetoothRepository, Store {
  late final _$bluetoothStateAtom =
      Atom(name: '_BluetoothRepository.bluetoothState', context: context);

  @override
  BluetoothState get bluetoothState {
    _$bluetoothStateAtom.reportRead();
    return super.bluetoothState;
  }

  bool _bluetoothStateIsInitialized = false;

  @override
  set bluetoothState(BluetoothState value) {
    _$bluetoothStateAtom.reportWrite(
        value, _bluetoothStateIsInitialized ? super.bluetoothState : null, () {
      super.bluetoothState = value;
      _bluetoothStateIsInitialized = true;
    });
  }

  late final _$scanningStateAtom =
      Atom(name: '_BluetoothRepository.scanningState', context: context);

  @override
  BluetoothScanningState get scanningState {
    _$scanningStateAtom.reportRead();
    return super.scanningState;
  }

  bool _scanningStateIsInitialized = false;

  @override
  set scanningState(BluetoothScanningState value) {
    _$scanningStateAtom.reportWrite(
        value, _scanningStateIsInitialized ? super.scanningState : null, () {
      super.scanningState = value;
      _scanningStateIsInitialized = true;
    });
  }

  late final _$scanResultsAtom =
      Atom(name: '_BluetoothRepository.scanResults', context: context);

  @override
  List<BluetoothScanResult> get scanResults {
    _$scanResultsAtom.reportRead();
    return super.scanResults;
  }

  @override
  set scanResults(List<BluetoothScanResult> value) {
    _$scanResultsAtom.reportWrite(value, super.scanResults, () {
      super.scanResults = value;
    });
  }

  late final _$deviceConnectionAtom =
      Atom(name: '_BluetoothRepository.deviceConnection', context: context);

  @override
  BluetoothConnection? get deviceConnection {
    _$deviceConnectionAtom.reportRead();
    return super.deviceConnection;
  }

  @override
  set deviceConnection(BluetoothConnection? value) {
    _$deviceConnectionAtom.reportWrite(value, super.deviceConnection, () {
      super.deviceConnection = value;
    });
  }

  late final _$deviceConnectionDataAtom =
      Atom(name: '_BluetoothRepository.deviceConnectionData', context: context);

  @override
  BluetoothData? get deviceConnectionData {
    _$deviceConnectionDataAtom.reportRead();
    return super.deviceConnectionData;
  }

  @override
  set deviceConnectionData(BluetoothData? value) {
    _$deviceConnectionDataAtom.reportWrite(value, super.deviceConnectionData,
        () {
      super.deviceConnectionData = value;
    });
  }

  @override
  String toString() {
    return '''
bluetoothState: ${bluetoothState},
scanningState: ${scanningState},
scanResults: ${scanResults},
deviceConnection: ${deviceConnection},
deviceConnectionData: ${deviceConnectionData}
    ''';
  }
}
