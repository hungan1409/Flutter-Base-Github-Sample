import 'package:app/data/model/repos.dart';
import 'package:app/foundation/extension/date_time_extension.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/font_size.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepoItem extends HookConsumerWidget {
  const GithubRepoItem({
    Key? key,
    required this.repositoryItem,
  }) : super(key: key);

  final Repos repositoryItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();

    final l10n = useL10n();
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Colors.white30)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePaddingMedium),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(repositoryItem.fullName ?? "",
                  style: const TextStyle(fontSize: FontSize.pt20, fontWeight: FontWeight.bold)),
              const SizedBox(height: LayoutSize.sizeBoxSmall),
              Text(repositoryItem.description ?? ""),
              const SizedBox(height: LayoutSize.sizeBoxSmall),
              Row(
                children: [
                  if (repositoryItem.language != null)
                    Row(children: [
                      const Icon(Icons.integration_instructions_outlined),
                      Text(repositoryItem.language.toString()),
                      const SizedBox(width: LayoutSize.sizeBoxLarge),
                    ]),
                  const Icon(Icons.visibility_outlined),
                  Text(repositoryItem.watchersCount.toString()),
                  const SizedBox(width: LayoutSize.sizeBoxLarge),
                  const Icon(Icons.star_outlined),
                  Text(repositoryItem.stargazersCount.toString()),
                  const SizedBox(width: LayoutSize.sizeBoxLarge),
                  const Icon(Icons.alt_route_outlined),
                  Text(repositoryItem.forksCount.toString()),
                ],
              ),
              const SizedBox(height: LayoutSize.sizeBoxSmall),
              Text(l10n.lastUpdate + DateTime.parse(repositoryItem.updatedAt ?? "").formatYYYYMMdd()),
            ],
          ),
          onTap: () {
            router.push(DetailRoute(repos: repositoryItem));
          },
        ),
      ),
    );
  }
}
