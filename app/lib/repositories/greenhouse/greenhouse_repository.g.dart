// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouse_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GreenhouseRepository on _GreenhousesRepository, Store {
  late final _$connectionAtom =
      Atom(name: '_GreenhousesRepository.connection', context: context);

  @override
  BluetoothConnectionEntity get connection {
    _$connectionAtom.reportRead();
    return super.connection;
  }

  bool _connectionIsInitialized = false;

  @override
  set connection(BluetoothConnectionEntity value) {
    _$connectionAtom.reportWrite(
        value, _connectionIsInitialized ? super.connection : null, () {
      super.connection = value;
      _connectionIsInitialized = true;
    });
  }

  late final _$stateAtom =
      Atom(name: '_GreenhousesRepository.state', context: context);

  @override
  GreenhouseStateEntity get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GreenhouseStateEntity value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
connection: ${connection},
state: ${state}
    ''';
  }
}
