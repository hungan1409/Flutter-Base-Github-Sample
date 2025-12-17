import 'package:app/data/repository/github_repository_impl.dart';
import 'package:app/foundation/app_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

final Provider<GithubRepositoryImpl> githubRepositoryProvider = Provider((ref) => GithubRepositoryImpl(ref));
final talkerProvider = Provider<Talker>((ref) {
  return TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: AppConfig.isShowLog(),
    ),
  );
});
