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
  BluetoothStateEntity? get bluetoothState {
    _$bluetoothStateAtom.reportRead();
    return super.bluetoothState;
  }

  @override
  set bluetoothState(BluetoothStateEntity? value) {
    _$bluetoothStateAtom.reportWrite(value, super.bluetoothState, () {
      super.bluetoothState = value;
    });
  }

  late final _$scanningStateAtom =
      Atom(name: '_BluetoothRepository.scanningState', context: context);

  @override
  BluetoothScanningStateEntity? get scanningState {
    _$scanningStateAtom.reportRead();
    return super.scanningState;
  }

  @override
  set scanningState(BluetoothScanningStateEntity? value) {
    _$scanningStateAtom.reportWrite(value, super.scanningState, () {
      super.scanningState = value;
    });
  }

  late final _$lastScanResultsAtom =
      Atom(name: '_BluetoothRepository.lastScanResults', context: context);

  @override
  List<BluetoothScanResultEntity> get lastScanResults {
    _$lastScanResultsAtom.reportRead();
    return super.lastScanResults;
  }

  @override
  set lastScanResults(List<BluetoothScanResultEntity> value) {
    _$lastScanResultsAtom.reportWrite(value, super.lastScanResults, () {
      super.lastScanResults = value;
    });
  }

  @override
  String toString() {
    return '''
bluetoothState: ${bluetoothState},
scanningState: ${scanningState},
lastScanResults: ${lastScanResults}
    ''';
  }
}
