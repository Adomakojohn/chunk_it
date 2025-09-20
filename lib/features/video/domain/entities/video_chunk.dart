import 'package:equatable/equatable.dart';
import 'video_metadata.dart';

class VideoChunk extends Equatable {
  final String id;
  final String parentVideoId;
  final String title;
  final Duration startTime;
  final Duration endTime;
  final String localFilePath;
  final VideoQuality quality;
  final int fileSizeBytes;
  final DateTime createdAt;
  final bool isSaved;

  const VideoChunk({
    required this.id,
    required this.parentVideoId,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.localFilePath,
    required this.quality,
    required this.fileSizeBytes,
    required this.createdAt,
    required this.isSaved,
  });

  @override
  List<Object?> get props => [
    id,
    parentVideoId,
    title,
    startTime,
    endTime,
    localFilePath,
    quality,
    fileSizeBytes,
    createdAt,
    isSaved,
  ];

  Duration get duration => endTime - startTime;

  double get fileSizeMB => fileSizeBytes / (1024 * 1024);

  bool get isValidChunk =>
      startTime < endTime &&
      duration.inSeconds >= 5 && // At least 5 seconds
      duration.inSeconds <= 180; // Max 3 minutes

  String get formattedDuration {
    final seconds = duration.inSeconds;
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    if (minutes == 0) {
      return '${remainingSeconds}s';
    } else {
      return '${minutes}m ${remainingSeconds}s';
    }
  }

  // Return a new chunk with updated save status
  VideoChunk copyWith({
    String? id,
    String? parentVideoId,
    String? title,
    Duration? startTime,
    Duration? endTime,
    String? localFilePath,
    VideoQuality? quality,
    int? fileSizeBytes,
    DateTime? createdAt,
    bool? isSaved,
  }) {
    return VideoChunk(
      id: id ?? this.id,
      parentVideoId: parentVideoId ?? this.parentVideoId,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      localFilePath: localFilePath ?? this.localFilePath,
      quality: quality ?? this.quality,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      createdAt: createdAt ?? this.createdAt,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
