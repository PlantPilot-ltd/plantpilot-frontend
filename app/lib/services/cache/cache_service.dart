import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:hive/hive.dart';

abstract class CacheService {
  final CacheServiceConfiguration configuration;

  const CacheService({required this.configuration});

  /// Close all processes
  void close();

  /// Clear all cache used in this service
  void cleanCache();

  /// Remove item from [box] by key [item.key] and insert new [item]
  ThrowableResponse<T> addOrUpdateItem<T extends CacheableObject>(
    Box<T> box,
    T item,
  ) {
    try {
      box.write(() {
        box.delete(item.key);
        box.put(item.key, item);
      });
      return ThrowableResponse.success(item);
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }

  /// Return item from [box] by key [key] if exist
  ThrowableResponse<T?> getItem<T extends CacheableObject>(
    Box<T> box,
    String key,
  ) {
    try {
      return ThrowableResponse.success(box.get(key));
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }

  /// Remove [item] from [box] by key [item.key]
  ThrowableResponse<T> removeItem<T extends CacheableObject>(
    Box<T> box,
    T item,
  ) {
    try {
      box.delete(item.key);
      return ThrowableResponse.success(item);
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }

  /// Fetch all items from [box]
  ThrowableResponse<List<T>> fetchItems<T extends CacheableObject>(
    Box<T> box,
  ) {
    try {
      return ThrowableResponse.success(
        box.getAll(box.keys).whereType<T>().toList(),
      );
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }

  /// Clears all data in [box] and insert new [items].
  ThrowableResponse<Iterable<T>> updateBox<T extends CacheableObject>(
    Box<T> box,
    Iterable<T> items,
  ) {
    try {
      // Clean cache
      box.clear();
      // Add items
      return addAll(box, items);
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }

  /// Add all [items] to [box]
  ThrowableResponse<Iterable<T>> addAll<T extends CacheableObject>(
    Box<T> box,
    Iterable<T> items,
  ) {
    try {
      box.putAll(
        Map.fromEntries(items.map((e) => MapEntry(e.key, e))),
      );
      return ThrowableResponse.success(items);
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppCacheException.fromException(e, stackTrace),
      );
    }
  }
}
