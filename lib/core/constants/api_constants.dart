import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String youtubeApiBaseUrl =
      'https://www.googleapis.com/youtube/v3';

  static String youtubeApiKey = dotenv.env['YOUTUBE_API_KEY']!;

  //Timeout durations
  static const int connectionTimeout = 30000;
  static const receiveTimeout = 30000;

  static const List<String> supportedQualities = [
    '360p',
    '480p',
    '720p',
    '1080p',
  ];
}
