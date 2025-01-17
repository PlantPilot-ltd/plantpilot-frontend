// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouse_add_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GreenhouseAddStore on _GreenhouseAddStore, Store {
  Computed<BluetoothScanResultEntity?>? _$scannedDeviceComputed;

  @override
  BluetoothScanResultEntity? get scannedDevice => (_$scannedDeviceComputed ??=
          Computed<BluetoothScanResultEntity?>(() => super.scannedDevice,
              name: '_GreenhouseAddStore.scannedDevice'))
      .value;

  late final _$nameAtom =
      Atom(name: '_GreenhouseAddStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  bool _nameIsInitialized = false;

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, _nameIsInitialized ? super.name : null, () {
      super.name = value;
      _nameIsInitialized = true;
    });
  }

  late final _$controllerConfigAtom =
      Atom(name: '_GreenhouseAddStore.controllerConfig', context: context);

  @override
  ControllerConfigEntity? get controllerConfig {
    _$controllerConfigAtom.reportRead();
    return super.controllerConfig;
  }

  @override
  set controllerConfig(ControllerConfigEntity? value) {
    _$controllerConfigAtom.reportWrite(value, super.controllerConfig, () {
      super.controllerConfig = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GreenhouseAddStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$plantsAtom =
      Atom(name: '_GreenhouseAddStore.plants', context: context);

  @override
  List<PlantEntity> get plants {
    _$plantsAtom.reportRead();
    return super.plants;
  }

  @override
  set plants(List<PlantEntity> value) {
    _$plantsAtom.reportWrite(value, super.plants, () {
      super.plants = value;
    });
  }

  late final _$selectedPlantsAtom =
      Atom(name: '_GreenhouseAddStore.selectedPlants', context: context);

  @override
  List<PlantEntity> get selectedPlants {
    _$selectedPlantsAtom.reportRead();
    return super.selectedPlants;
  }

  @override
  set selectedPlants(List<PlantEntity> value) {
    _$selectedPlantsAtom.reportWrite(value, super.selectedPlants, () {
      super.selectedPlants = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_GreenhouseAddStore.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_fetchConfigAsyncAction =
      AsyncAction('_GreenhouseAddStore._fetchConfig', context: context);

  @override
  Future<void> _fetchConfig() {
    return _$_fetchConfigAsyncAction.run(() => super._fetchConfig());
  }

  late final _$_fetchPlantsAsyncAction =
      AsyncAction('_GreenhouseAddStore._fetchPlants', context: context);

  @override
  Future<void> _fetchPlants() {
    return _$_fetchPlantsAsyncAction.run(() => super._fetchPlants());
  }

  late final _$_GreenhouseAddStoreActionController =
      ActionController(name: '_GreenhouseAddStore', context: context);

  @override
  void selectPlant(PlantEntity plant) {
    final _$actionInfo = _$_GreenhouseAddStoreActionController.startAction(
        name: '_GreenhouseAddStore.selectPlant');
    try {
      return super.selectPlant(plant);
    } finally {
      _$_GreenhouseAddStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String name) {
    final _$actionInfo = _$_GreenhouseAddStoreActionController.startAction(
        name: '_GreenhouseAddStore.changeName');
    try {
      return super.changeName(name);
    } finally {
      _$_GreenhouseAddStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
controllerConfig: ${controllerConfig},
isLoading: ${isLoading},
plants: ${plants},
selectedPlants: ${selectedPlants},
scannedDevice: ${scannedDevice}
    ''';
  }
}
