import 'package:chunkit/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/chunk_settings.dart';

abstract class UserPreferencesRepository {
  /// Get user's chunk settings
  Future<Either<Failure, ChunkSettings>> getChunkSettings();

  /// Save user's chunk settings
  Future<Either<Failure, Unit>> saveChunkSettings(ChunkSettings settings);

  /// Reset to default settings
  Future<Either<Failure, ChunkSettings>> resetToDefaults();
}
