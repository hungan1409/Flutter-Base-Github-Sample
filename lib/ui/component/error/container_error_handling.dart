import 'package:app/provider/error_provider.dart';
import 'package:app/ui/component/dialog/error_dialog.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContainerErrorHandling extends HookConsumerWidget {
  const ContainerErrorHandling({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDialogShowing = useState(false);

    // Check and show error when call api
    final appError = ref.watch(errorProvider.select((value) => value.appError));
    if (appError != null) {
      Future.delayed(Duration.zero, () {
        // Prevent dialog show multi times
        if (!isDialogShowing.value) {
          isDialogShowing.value = true;
          if (context.mounted) {
            handleError(context, appError, () {
              isDialogShowing.value = false;
            });
          }
        }
      });
      ref.read(errorProvider).resetError();
    }

    return ContainerWithLoading(child: child);
  }
}
