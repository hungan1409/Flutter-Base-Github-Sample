// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'CANCEL';

  @override
  String get hintSearch => 'Please input the name of user';

  @override
  String get repositories => 'Repositories';

  @override
  String get noResult => 'No item found!';

  @override
  String get lastUpdate => 'Last updated at ';

  @override
  String get setting => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get talkerLog => 'Talker Log';

  @override
  String get forceUpdateTitle => 'UPDATE NEW VERSION';

  @override
  String get forceUpdateContent => 'A new version of this app is available now!';

  @override
  String get searchGithubUsers => 'Search GitHub Users';

  @override
  String get searchGithubUsersHint => 'Enter a username to explore their repositories';

  @override
  String get allRepositoriesLoaded => 'All repositories loaded';

  @override
  String get githubExplorer => 'GitHub Explorer';

  @override
  String get errorOccurred => 'Error Occurred';
}
