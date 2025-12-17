import 'package:app/foundation/app_config.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_text_theme.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => router.pop(),
        ),
        title: Text(l10n.setting),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: LayoutSize.sizePaddingMedium,
        ),
        children: [
          // Language Setting
          _SettingItem(
            icon: Icons.language_rounded,
            title: l10n.language,
            onTap: () => router.push(const LanguageRoute()),
          ),

          if (AppConfig.isShowLog()) ...[
            Divider(
              height: 1,
              indent: LayoutSize.sizePadding16,
              endIndent: LayoutSize.sizePadding16,
              color: appColors.outline.withAlpha(50),
            ),

            // Talker Log Setting
            _SettingItem(
              icon: Icons.bug_report_rounded,
              title: l10n.talkerLog,
              onTap: () => router.push(const TalkerRoute()),
            ),
          ],
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutSize.sizePadding16,
          vertical: LayoutSize.sizePadding14,
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(LayoutSize.sizeBoxSmall),
              decoration: BoxDecoration(
                color: appColors.primary.withAlpha(25),
                borderRadius: BorderRadius.circular(LayoutSize.borderRadius10),
              ),
              child: Icon(
                icon,
                size: LayoutSize.iconSize24,
                color: appColors.primary,
              ),
            ),
            const SizedBox(width: LayoutSize.sizePadding16),

            // Title
            Expanded(
              child: Text(
                title,
                style: appTextTheme.s16.medium(),
              ),
            ),

            // Trailing arrow
            Icon(
              Icons.chevron_right_rounded,
              color: appColors.outline,
            ),
          ],
        ),
      ),
    );
  }
}
