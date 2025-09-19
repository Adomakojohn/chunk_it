class AppConstants {
  // Chunk duration options (in seconds)
  static const List<int> chunkDurations = [15, 30, 60, 120];
  static const int defaultChunkDuration = 30;

  // File paths
  static const String chunksDirectory = 'chunkit_chunks';
  static const String tempDirectory = 'temp';

  // Shared preferences keys
  static const String userChunkDurationKey = 'chunk_duration';
  static const String userQualityPreferenceKey = 'quality_preference';

  // Validation
  static const int maxVideoLengthMinutes = 60; // 1 hour max
  static const int minVideoLengthSeconds = 10; // 10 seconds min
}
