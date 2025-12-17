import 'package:app/data/model/repos.dart';
import 'package:app/foundation/extension/date_time_extension.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_text_theme.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepoItem extends HookConsumerWidget {
  const GithubRepoItem({super.key, required this.repositoryItem});

  final Repos repositoryItem;

  // Language colors mapping (GitHub style)
  static const Map<String, Color> _languageColors = {
    'Dart': Color(0xFF00B4AB),
    'JavaScript': Color(0xFFF7DF1E),
    'TypeScript': Color(0xFF3178C6),
    'Python': Color(0xFF3572A5),
    'Java': Color(0xFFB07219),
    'Kotlin': Color(0xFFA97BFF),
    'Swift': Color(0xFFFA7343),
    'Go': Color(0xFF00ADD8),
    'Rust': Color(0xFFDEA584),
    'C++': Color(0xFFF34B7D),
    'C#': Color(0xFF178600),
    'Ruby': Color(0xFF701516),
    'PHP': Color(0xFF4F5D95),
    'HTML': Color(0xFFE34C26),
    'CSS': Color(0xFF563D7C),
    'Vue': Color(0xFF41B883),
    'Shell': Color(0xFF89E051),
  };

  Color _getLanguageColor(String? language, AppColorScheme appColors) {
    if (language == null) return appColors.outline;
    return _languageColors[language] ?? appColors.outline;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: LayoutSize.sizeBox12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutSize.borderRadius12),
        side: BorderSide(
          color: appColors.outline.withAlpha(50),
        ),
      ),
      elevation: 1,
      shadowColor: appColors.outline.withAlpha(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(LayoutSize.borderRadius12),
        onTap: () => router.push(DetailRoute(repos: repositoryItem)),
        child: Padding(
          padding: const EdgeInsets.all(LayoutSize.sizePadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Repository name with icon
              Row(
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: LayoutSize.iconSizeLarge,
                    color: appColors.primary,
                  ),
                  const SizedBox(width: LayoutSize.sizeBoxSmall),
                  Expanded(
                    child: Text(
                      repositoryItem.fullName ?? '',
                      style: appTextTheme.s16.semiBold().copyWith(
                        color: appColors.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              // Description
              if (repositoryItem.description != null &&
                  repositoryItem.description!.isNotEmpty) ...[
                const SizedBox(height: LayoutSize.sizeBoxSmall),
                Text(
                  repositoryItem.description!,
                  style: appTextTheme.s14.copyWith(
                    color: appColors.onSurface.withAlpha(179),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              const SizedBox(height: LayoutSize.sizeBox12),

              // Stats row
              Wrap(
                spacing: LayoutSize.sizeBoxMedium,
                runSpacing: LayoutSize.sizeBoxSmall,
                children: [
                  // Language
                  if (repositoryItem.language != null)
                    _buildStatChip(
                      context,
                      icon: Container(
                        width: LayoutSize.sizeBox12,
                        height: LayoutSize.sizeBox12,
                        decoration: BoxDecoration(
                          color: _getLanguageColor(repositoryItem.language, appColors),
                          shape: BoxShape.circle,
                        ),
                      ),
                      label: repositoryItem.language!,
                    ),

                  // Stars
                  _buildStatChip(
                    context,
                    icon: Icon(
                      Icons.star_rounded,
                      size: LayoutSize.iconSizeMedium,
                      color: appColors.starColor,
                    ),
                    label: _formatCount(repositoryItem.stargazersCount ?? 0),
                  ),

                  // Forks
                  _buildStatChip(
                    context,
                    icon: Icon(
                      Icons.fork_right_rounded,
                      size: LayoutSize.iconSizeMedium,
                      color: appColors.onSurface.withAlpha(153),
                    ),
                    label: _formatCount(repositoryItem.forksCount ?? 0),
                  ),

                  // Watchers
                  _buildStatChip(
                    context,
                    icon: Icon(
                      Icons.visibility_outlined,
                      size: LayoutSize.iconSizeMedium,
                      color: appColors.onSurface.withAlpha(153),
                    ),
                    label: _formatCount(repositoryItem.watchersCount ?? 0),
                  ),
                ],
              ),

              // Last updated
              if (repositoryItem.updatedAt != null) ...[
                const SizedBox(height: LayoutSize.sizeBox12),
                Row(
                  children: [
                    Icon(
                      Icons.update_rounded,
                      size: LayoutSize.iconSizeSmall,
                      color: appColors.onSurface.withAlpha(128),
                    ),
                    const SizedBox(width: LayoutSize.sizePaddingSmall),
                    Text(
                      l10n.lastUpdate +
                          (DateTime.tryParse(repositoryItem.updatedAt!)
                                  ?.formatYYYYMMdd() ??
                              ''),
                      style: appTextTheme.s12.copyWith(
                        color: appColors.onSurface.withAlpha(128),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(
    BuildContext context, {
    required Widget icon,
    required String label,
  }) {
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: LayoutSize.sizePaddingSmall),
        Text(
          label,
          style: appTextTheme.s12.medium().copyWith(
            color: appColors.onSurface.withAlpha(179),
          ),
        ),
      ],
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }
}
