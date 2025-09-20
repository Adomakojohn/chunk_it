// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chunkit/features/video/domain/repositories/video_repository.dart'
    as _i170;
import 'package:chunkit/features/video/domain/usecases/extract_video_chunks.dart'
    as _i600;
import 'package:chunkit/features/video/domain/usecases/get_youtube_video_info.dart'
    as _i542;
import 'package:chunkit/features/video/domain/usecases/save_video_chunk.dart'
    as _i83;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i600.ExtractVideoChunks>(
      () => _i600.ExtractVideoChunks(gh<_i170.VideoRepository>()),
    );
    gh.factory<_i542.GetYouTubeVideoInfo>(
      () => _i542.GetYouTubeVideoInfo(gh<_i170.VideoRepository>()),
    );
    gh.factory<_i83.SaveVideoChunk>(
      () => _i83.SaveVideoChunk(gh<_i170.VideoRepository>()),
    );
    return this;
  }
}
