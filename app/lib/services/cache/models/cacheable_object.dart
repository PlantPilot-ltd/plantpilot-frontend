import 'package:equatable/equatable.dart';

abstract class CacheableObject extends Equatable {
  String get key;

  // factory CacheableObject.fromJson(Map<String, dynamic> json){}

  Map<String, dynamic> toJson();
}
