import 'package:chunkit/core/error/failures.dart';
import 'package:chunkit/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/video_metadata.dart';
import '../repositories/video_repository.dart';

@injectable
class GetYouTubeVideoInfo
    implements UseCase<VideoMetadata, GetYouTubeVideoInfoParams> {
  final VideoRepository repository;

  const GetYouTubeVideoInfo(this.repository);

  @override
  Future<Either<Failure, VideoMetadata>> call(
    GetYouTubeVideoInfoParams params,
  ) async {
    if (!_isValidYouTubeUrl(params.url)) {
      return const Left(InvalidInputFailure('Invalid YouTube URL format'));
    }

    return await repository.getVideoMetadata(params.url);
  }

  bool _isValidYouTubeUrl(String url) {
    // YouTube URL patterns
    final youtubeRegex = RegExp(
      r'^https?:\/\/(?:www\.)?(?:youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
    );
    return youtubeRegex.hasMatch(url);
  }
}

class GetYouTubeVideoInfoParams {
  final String url;

  const GetYouTubeVideoInfoParams({required this.url});
}
