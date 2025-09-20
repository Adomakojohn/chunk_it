import 'package:chunkit/core/error/failures.dart';
import 'package:chunkit/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/video_metadata.dart';
import '../entities/video_chunk.dart';
import '../entities/chunk_settings.dart';
import '../repositories/video_repository.dart';

@injectable
class ExtractVideoChunks
    implements UseCase<List<VideoChunk>, ExtractVideoChunksParams> {
  final VideoRepository repository;

  const ExtractVideoChunks(this.repository);

  @override
  Future<Either<Failure, List<VideoChunk>>> call(
    ExtractVideoChunksParams params,
  ) async {
    if (!params.videoMetadata.canBeChunked) {
      return const Left(
        InvalidInputFailure(
          'Video cannot be chunked. Duration must be between 30 seconds and 1 hour.',
        ),
      );
    }

    if (!params.settings.isValid) {
      return const Left(InvalidInputFailure('Invalid chunk settings provided'));
    }

    final estimatedChunks = params.settings.calculateChunkCount(
      params.videoMetadata.duration,
    );
    if (estimatedChunks == 0) {
      return const Left(
        InvalidInputFailure('Video too short for selected chunk duration'),
      );
    }

    return await repository.extractVideoChunks(
      videoMetadata: params.videoMetadata,
      settings: params.settings,
    );
  }
}

class ExtractVideoChunksParams {
  final VideoMetadata videoMetadata;
  final ChunkSettings settings;

  const ExtractVideoChunksParams({
    required this.videoMetadata,
    required this.settings,
  });
}
