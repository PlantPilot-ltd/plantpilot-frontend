// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouses_list_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GreenhousesListRepository on _GreenhousesListRepository, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GreenhousesListRepository.isLoading', context: context);

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

  late final _$greenhousesAtom =
      Atom(name: '_GreenhousesListRepository.greenhouses', context: context);

  @override
  List<GreenhouseEntity> get greenhouses {
    _$greenhousesAtom.reportRead();
    return super.greenhouses;
  }

  @override
  set greenhouses(List<GreenhouseEntity> value) {
    _$greenhousesAtom.reportWrite(value, super.greenhouses, () {
      super.greenhouses = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_GreenhousesListRepository.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_fetchLocalDataAsyncAction = AsyncAction(
      '_GreenhousesListRepository._fetchLocalData',
      context: context);

  @override
  Future<void> _fetchLocalData() {
    return _$_fetchLocalDataAsyncAction.run(() => super._fetchLocalData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
greenhouses: ${greenhouses}
    ''';
  }
}
