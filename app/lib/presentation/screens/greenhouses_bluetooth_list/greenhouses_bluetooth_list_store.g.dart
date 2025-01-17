// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouses_bluetooth_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GreenhousesBluetoothListStore on _GreenhousesBluetoothListStore, Store {
  Computed<List<BluetoothScanResultEntity>>? _$lastScanResultsComputed;

  @override
  List<BluetoothScanResultEntity> get lastScanResults =>
      (_$lastScanResultsComputed ??= Computed<List<BluetoothScanResultEntity>>(
              () => super.lastScanResults,
              name: '_GreenhousesBluetoothListStore.lastScanResults'))
          .value;

  @override
  String toString() {
    return '''
lastScanResults: ${lastScanResults}
    ''';
  }
}
