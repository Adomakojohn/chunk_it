import 'package:equatable/equatable.dart';
import 'video_metadata.dart';

class ChunkSettings extends Equatable {
  final Duration chunkDuration;
  final VideoQuality preferredQuality;
  final bool autoSaveChunks;
  final int maxChunksPerVideo;
  final bool includeTransitions;

  const ChunkSettings({
    required this.chunkDuration,
    required this.preferredQuality,
    required this.autoSaveChunks,
    required this.maxChunksPerVideo,
    required this.includeTransitions,
  });

  @override
  List<Object?> get props => [
    chunkDuration,
    preferredQuality,
    autoSaveChunks,
    maxChunksPerVideo,
    includeTransitions,
  ];

  factory ChunkSettings.defaultSettings() {
    return const ChunkSettings(
      chunkDuration: Duration(seconds: 30),
      preferredQuality: VideoQuality.medium,
      autoSaveChunks: false,
      maxChunksPerVideo: 10,
      includeTransitions: false,
    );
  }

  int calculateChunkCount(Duration videoDuration) {
    final totalSeconds = videoDuration.inSeconds;
    final chunkSeconds = chunkDuration.inSeconds;
    final calculatedChunks = (totalSeconds / chunkSeconds).ceil();

    return calculatedChunks > maxChunksPerVideo
        ? maxChunksPerVideo
        : calculatedChunks;
  }

  // Validate settings
  bool get isValid {
    return chunkDuration.inSeconds >= 10 && // Min 10 seconds
        chunkDuration.inSeconds <= 300 && // Max 5 minutes
        maxChunksPerVideo > 0 &&
        maxChunksPerVideo <= 50;
  }

  ChunkSettings copyWith({
    Duration? chunkDuration,
    VideoQuality? preferredQuality,
    bool? autoSaveChunks,
    int? maxChunksPerVideo,
    bool? includeTransitions,
  }) {
    return ChunkSettings(
      chunkDuration: chunkDuration ?? this.chunkDuration,
      preferredQuality: preferredQuality ?? this.preferredQuality,
      autoSaveChunks: autoSaveChunks ?? this.autoSaveChunks,
      maxChunksPerVideo: maxChunksPerVideo ?? this.maxChunksPerVideo,
      includeTransitions: includeTransitions ?? this.includeTransitions,
    );
  }
}
