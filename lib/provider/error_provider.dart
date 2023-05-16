import 'package:app/data/handler/error_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorProvider = ChangeNotifierProvider((ref) => ErrorHandler());
