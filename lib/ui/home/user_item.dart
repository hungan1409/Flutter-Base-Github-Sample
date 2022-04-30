import 'package:app/data/model/user.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/theme/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserItem extends HookConsumerWidget {
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  final double paddingLeft = 70;
  final double radiusCard = 10;
  final double radiusAvatar = 40;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusCard)),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF00CBCF),
                Color(0xFF007AD9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(radiusCard),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: profileImageProvider(user.avatarUrl),
                    backgroundColor: Colors.transparent,
                    radius: radiusAvatar,
                  ),
                  title: Text(
                    user.publicRepos.toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: FontSize.pt32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text(l10n.repositories,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingLeft),
                child: Text(
                  user.name ?? "",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: FontSize.pt24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Divider(color: Colors.white, indent: paddingLeft),
              if (user.email != null)
                Padding(
                  padding: EdgeInsets.only(left: paddingLeft),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.0),
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    minLeadingWidth: 0,
                    leading: const Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    title: Text(user.email ?? "",
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              if (user.htmlUrl != null)
                Padding(
                  padding: EdgeInsets.only(left: paddingLeft),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.0),
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    minLeadingWidth: 0,
                    leading: const Icon(Icons.link, color: Colors.white),
                    title: Text(user.htmlUrl ?? "",
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
            ],
          ),
        ));
  }
}
