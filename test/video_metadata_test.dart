import 'package:flutter_test/flutter_test.dart';
import 'package:chunkit/features/video/domain/entities/video_metadata.dart';

void main() {
  group('VideoMetadata', () {
    test('should be a valid long video when duration > 10 minutes', () {
      // Arrange
      final videoMetadata = VideoMetadata(
        id: 'test_id',
        title: 'Test Video',
        description: 'Test Description',
        duration: Duration(minutes: 15),
        thumbnailUrl: 'https://example.com/thumb.jpg',
        channelName: 'Test Channel',
        viewCount: 1000,
        uploadDate: DateTime.now(),
        availableQualities: [VideoQuality.hd720],
      );

      // Act & Assert
      expect(videoMetadata.isLongVideo, true);
    });

    test(
      'should be chunkable when duration is between 30 seconds and 60 minutes',
      () {
        // Arrange
        final videoMetadata = VideoMetadata(
          id: 'test_id',
          title: 'Test Video',
          description: 'Test Description',
          duration: Duration(minutes: 5),
          thumbnailUrl: 'https://example.com/thumb.jpg',
          channelName: 'Test Channel',
          viewCount: 1000,
          uploadDate: DateTime.now(),
          availableQualities: [VideoQuality.medium],
        );

        // Act & Assert
        expect(videoMetadata.canBeChunked, true);
      },
    );
  });
}
