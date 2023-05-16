import 'package:app/data/repository/github_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final isarProvider = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([], directory: dir.path);
});

final githubRepositoryProvider = Provider((ref) => GithubRepositoryImpl(ref));
