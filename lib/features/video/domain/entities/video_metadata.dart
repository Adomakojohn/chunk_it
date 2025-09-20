import 'package:equatable/equatable.dart';

class VideoMetadata extends Equatable {
  final String id;
  final String title;
  final String description;
  final Duration duration;
  final String thumbnailUrl;
  final String channelName;
  final int viewCount;
  final DateTime uploadDate;
  final List<VideoQuality> availableQualities;

  const VideoMetadata({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.thumbnailUrl,
    required this.channelName,
    required this.viewCount,
    required this.uploadDate,
    required this.availableQualities,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    duration,
    thumbnailUrl,
    channelName,
    viewCount,
    uploadDate,
    availableQualities,
  ];

  bool get isLongVideo => duration.inMinutes > 10;

  bool get canBeChunked =>
      duration.inSeconds >= 30 && // At least 30 seconds
      duration.inMinutes <= 60; // Max 1 hour

  // Get the best quality available
  VideoQuality get bestQuality {
    if (availableQualities.contains(VideoQuality.hd720)) {
      return VideoQuality.hd720;
    } else if (availableQualities.contains(VideoQuality.medium)) {
      return VideoQuality.medium;
    } else {
      return VideoQuality.small;
    }
  }
}

enum VideoQuality {
  small, // 360p
  medium, // 480p
  hd720, // 720p
}

extension VideoQualityExtension on VideoQuality {
  String get displayName {
    switch (this) {
      case VideoQuality.small:
        return '360p';
      case VideoQuality.medium:
        return '480p';
      case VideoQuality.hd720:
        return '720p';
    }
  }

  int get heightPixels {
    switch (this) {
      case VideoQuality.small:
        return 360;
      case VideoQuality.medium:
        return 480;
      case VideoQuality.hd720:
        return 720;
    }
  }
}
