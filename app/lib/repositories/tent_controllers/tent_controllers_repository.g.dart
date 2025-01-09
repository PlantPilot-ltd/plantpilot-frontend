// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tent_controllers_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TentContollersRepository on _TentContollersRepository, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TentContollersRepository.isLoading', context: context);

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

  late final _$controllersAtom =
      Atom(name: '_TentContollersRepository.controllers', context: context);

  @override
  List<TentController> get controllers {
    _$controllersAtom.reportRead();
    return super.controllers;
  }

  @override
  set controllers(List<TentController> value) {
    _$controllersAtom.reportWrite(value, super.controllers, () {
      super.controllers = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_TentContollersRepository.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_fetchLocalDataAsyncAction = AsyncAction(
      '_TentContollersRepository._fetchLocalData',
      context: context);

  @override
  Future<void> _fetchLocalData() {
    return _$_fetchLocalDataAsyncAction.run(() => super._fetchLocalData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
controllers: ${controllers}
    ''';
  }
}
