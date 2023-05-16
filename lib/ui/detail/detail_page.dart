import 'package:app/data/model/repos.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class DetailPage extends HookConsumerWidget {
  const DetailPage({Key? key, required this.repos}) : super(key: key);

  final Repos repos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              router.pop();
            },
          ),
          title: Text(repos.fullName.toString()),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: repos.htmlUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
