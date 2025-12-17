import 'package:app/ui/component/loading/loading.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContainerWithLoading extends ConsumerWidget {
  const ContainerWithLoading({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loadingStateProvider);
    return Stack(
      children: [child, if (state.isLoading) const Loading() else const SizedBox()],
    );
  }
}
