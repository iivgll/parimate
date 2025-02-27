import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/app_metadata.dart';
import '../repositories/providers.dart';
import 'app_logger.dart';

part 'metadata_notifier.g.dart';

@riverpod
class Metadata extends _$Metadata {
  @override
  FutureOr<AppMetadata> build() async {
    try {
      final result = await _loadMetadata();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<AppMetadata> _loadMetadata() async {
    try {
      final repository = ref.read(metadataRepositoryProvider);
      final result = await repository.getMetadata();
      return result;
    } catch (e) {
      AppLogger.error('Error loading metadata: $e');
      rethrow;
    }
  }

  Future<void> refresh() async {
    AppLogger.log('Metadata refresh called');
    state = const AsyncValue.loading();
    try {
      final metadata = await _loadMetadata();
      state = AsyncValue.data(metadata);
      AppLogger.log('Metadata refresh succeeded');
    } catch (error, stackTrace) {
      AppLogger.error('Metadata refresh failed: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
