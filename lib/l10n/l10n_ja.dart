// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get ok => 'わかった';

  @override
  String get cancel => 'キャンセル';

  @override
  String get hintSearch => 'ユーザー名を入力してください';

  @override
  String get repositories => 'リポジトリ';

  @override
  String get noResult => 'アイテムが見つかりません!';

  @override
  String get lastUpdate => '最終更新日 ';

  @override
  String get setting => '設定';

  @override
  String get language => '言語';

  @override
  String get talkerLog => 'Talkerログ';

  @override
  String get forceUpdateTitle => '新しいバージョンへアップデートする';

  @override
  String get forceUpdateContent => '新しいバージョンが利用可能になりました！';

  @override
  String get searchGithubUsers => 'GitHubユーザーを検索';

  @override
  String get searchGithubUsersHint => 'ユーザー名を入力してリポジトリを探索';

  @override
  String get allRepositoriesLoaded => 'すべてのリポジトリを読み込みました';

  @override
  String get githubExplorer => 'GitHub Explorer';

  @override
  String get errorOccurred => 'エラーが発生しました';
}
