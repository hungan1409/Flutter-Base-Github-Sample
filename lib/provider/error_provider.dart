import 'package:app/data/handler/error_handler.dart';
import 'package:hooks_riverpod/legacy.dart';

final ChangeNotifierProvider<ErrorHandler> errorProvider = ChangeNotifierProvider((ref) => ErrorHandler());
