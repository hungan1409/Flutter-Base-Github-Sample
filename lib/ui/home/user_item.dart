import 'package:app/data/model/user.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/font_size.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserItem extends HookConsumerWidget {
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final appColors = context.appColors;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutSize.borderRadius12),
      ),
      elevation: LayoutSize.elevationMedium,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appColors.gradientStart, appColors.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(LayoutSize.sizePadding16),
          child: Column(
            children: [
              // Avatar and Name Section
              Row(
                children: [
                  // Avatar with border
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appColors.textOnGradient,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: profileImageProvider(user.avatarUrl),
                      backgroundColor: Colors.transparent,
                      radius: LayoutSize.avatarRadiusMedium,
                    ),
                  ),
                  const SizedBox(width: LayoutSize.sizePadding16),
                  // Name and Username
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? 'Unknown',
                          style: TextStyle(
                            fontSize: FontSize.pt20,
                            fontWeight: FontWeight.bold,
                            color: appColors.textOnGradient,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (user.htmlUrl != null) ...[
                          const SizedBox(height: LayoutSize.sizePaddingSmall),
                          Text(
                            _extractUsername(user.htmlUrl!),
                            style: TextStyle(
                              fontSize: FontSize.pt14,
                              color: appColors.textOnGradient.withAlpha(200),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: LayoutSize.sizePadding16),

              // Stats Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: LayoutSize.sizePadding16,
                  vertical: LayoutSize.sizePaddingLarge,
                ),
                decoration: BoxDecoration(
                  color: appColors.textOnGradient.withAlpha(30),
                  borderRadius: BorderRadius.circular(LayoutSize.borderRadius10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatItem(
                      appColors: appColors,
                      icon: Icons.book_outlined,
                      value: user.publicRepos?.toString() ?? '0',
                      label: l10n.repositories,
                    ),
                  ],
                ),
              ),

              // Contact Info Section
              if (user.email != null || user.htmlUrl != null) ...[
                const SizedBox(height: LayoutSize.sizePadding16),
                Container(
                  padding: const EdgeInsets.all(LayoutSize.sizePaddingLarge),
                  decoration: BoxDecoration(
                    color: appColors.textOnGradient.withAlpha(20),
                    borderRadius:
                        BorderRadius.circular(LayoutSize.borderRadius10),
                  ),
                  child: Column(
                    children: [
                      if (user.email != null)
                        _buildContactRow(
                          appColors: appColors,
                          icon: Icons.mail_outline_rounded,
                          text: user.email!,
                        ),
                      if (user.email != null && user.htmlUrl != null)
                        const SizedBox(height: LayoutSize.sizeBoxSmall),
                      if (user.htmlUrl != null)
                        _buildContactRow(
                          appColors: appColors,
                          icon: Icons.link_rounded,
                          text: user.htmlUrl!,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required AppColorScheme appColors,
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: appColors.textOnGradient,
              size: LayoutSize.iconSize24,
            ),
            const SizedBox(width: LayoutSize.sizeBoxSmall),
            Text(
              value,
              style: TextStyle(
                fontSize: FontSize.pt24,
                fontWeight: FontWeight.bold,
                color: appColors.textOnGradient,
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutSize.sizePaddingSmall),
        Text(
          label,
          style: TextStyle(
            fontSize: FontSize.pt12,
            color: appColors.textOnGradient.withAlpha(200),
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow({
    required AppColorScheme appColors,
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: appColors.textOnGradient,
          size: LayoutSize.iconSizeLarge,
        ),
        const SizedBox(width: LayoutSize.sizeBoxSmall),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: FontSize.pt14,
              color: appColors.textOnGradient,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _extractUsername(String htmlUrl) {
    // Extract username from GitHub URL like https://github.com/username
    final uri = Uri.tryParse(htmlUrl);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      return '@${uri.pathSegments.first}';
    }
    return htmlUrl;
  }
}
