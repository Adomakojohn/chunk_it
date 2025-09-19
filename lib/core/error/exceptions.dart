class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}

class VideoProcessingException implements Exception {
  final String message;
  const VideoProcessingException(this.message);
}

class InvalidUrlException implements Exception {
  final String message;
  const InvalidUrlException(this.message);
}
