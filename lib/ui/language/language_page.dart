import 'package:app/foundation/constants.dart';
import 'package:app/foundation/extension/widget_extension.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/language/language_view_model.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:app/ui/theme/font_size.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LanguagePage extends HookConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final appColors = ref.read(appThemeProvider).appColors;
    final viewModel = ref.watch(languageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            router.pop();
          },
        ),
        title: Text(l10n.language),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
            color: appColors.border,
            height: 0,
            indent: LayoutSize.sizePadding20,
            endIndent: LayoutSize.sizePadding20),
        itemCount: Constants.supportedLanguages.length + 1,
        itemBuilder: (context, index) {
          if (index == Constants.supportedLanguages.length) {
            return Container();
          }
          final locale = Constants.supportedLanguages.keys.elementAt(index);
          final name = Constants.supportedLanguages[locale]!;
          final isChecked =
              viewModel.currentLocale.languageCode == locale ? true : false;

          return InkWell(
            onTap: () {
              viewModel.changeLocale(Locale(locale));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutSize.sizePadding20,
                  vertical: LayoutSize.sizePadding16),
              child: Row(
                children: [
                  _buildCheckBox(
                    isChecked,
                    appColors,
                    (_) {
                      viewModel.changeLocale(Locale(locale));
                    },
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: FontSize.pt16),
                  ).paddingOnly(left: LayoutSize.sizePadding16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheckBox(
      bool isChecked, AppColors appColors, ValueChanged<bool?> onChanged) {
    return Container(
      padding: EdgeInsets.zero,
      width: LayoutSize.sizeBoxLarge,
      height: LayoutSize.sizeBoxLarge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutSize.borderRadius4),
          border: Border.all(
              width: LayoutSize.borderSize1,
              color: isChecked ? appColors.primary : appColors.icon)),
      child: Checkbox(
        value: isChecked,
        tristate: false,
        onChanged: onChanged,
        activeColor: Colors.transparent,
        checkColor: appColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutSize.borderRadius4)),
      ),
    );
  }
}
