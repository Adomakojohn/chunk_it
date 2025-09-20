import 'package:chunkit/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/video_metadata.dart';
import '../entities/video_chunk.dart';
import '../entities/chunk_settings.dart';

abstract class VideoRepository {
  // Extract metadata from YouTube URL
  Future<Either<Failure, VideoMetadata>> getVideoMetadata(String youtubeUrl);

  // Download and process video into chunks
  Future<Either<Failure, List<VideoChunk>>> extractVideoChunks({
    required VideoMetadata videoMetadata,
    required ChunkSettings settings,
  });

  // Save a chunk to local storage
  Future<Either<Failure, VideoChunk>> saveChunk(VideoChunk chunk);

  // Get all saved chunks
  Future<Either<Failure, List<VideoChunk>>> getSavedChunks();

  // Delete a chunk
  Future<Either<Failure, Unit>> deleteChunk(String chunkId);

  // Get chunks for a specific video
  Future<Either<Failure, List<VideoChunk>>> getChunksForVideo(String videoId);
}
