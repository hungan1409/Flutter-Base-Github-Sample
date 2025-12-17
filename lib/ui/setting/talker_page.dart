import 'package:app/provider/data_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

// talker_route.dart
@RoutePage()
class TalkerPage extends ConsumerWidget {
  const TalkerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = ref.watch(talkerProvider);

    return TalkerScreen(talker: talker);
  }
}
