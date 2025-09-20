import 'package:chunkit/core/error/failures.dart';
import 'package:chunkit/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/video_chunk.dart';
import '../repositories/video_repository.dart';

@injectable
class SaveVideoChunk implements UseCase<VideoChunk, SaveVideoChunkParams> {
  final VideoRepository repository;

  const SaveVideoChunk(this.repository);

  @override
  Future<Either<Failure, VideoChunk>> call(SaveVideoChunkParams params) async {
    if (!params.chunk.isValidChunk) {
      return const Left(
        InvalidInputFailure(
          'Invalid chunk: duration must be between 5 seconds and 3 minutes',
        ),
      );
    }

    if (params.chunk.isSaved) {
      return const Left(InvalidInputFailure('Chunk is already saved'));
    }

    return await repository.saveChunk(params.chunk);
  }
}

class SaveVideoChunkParams {
  final VideoChunk chunk;

  const SaveVideoChunkParams({required this.chunk});
}
