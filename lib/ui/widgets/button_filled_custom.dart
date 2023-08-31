import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_padding.dart';
import 'package:transisi_apps/core/utils/res/app_radius.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/core/utils/utils.dart';

class ButtonFilledCustom extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final String? leftIcon;
  final bool isEnable;
  final VoidCallback? onTap;
  final bool? isLoading;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const ButtonFilledCustom({
    super.key,
    this.title = '',
    this.onTap,
    this.style,
    this.leftIcon,
    this.isEnable = true,
    this.isLoading = false,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(AppPadding.padding_12),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: isEnable ? AppColors.beige : AppColors.neutral_500,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.radius_8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading == true) ...[
              const Center(
                child: CircularProgressIndicator(color: AppColors.white),
              )
            ] else ...[
              if (leftIcon != null || leftIcon == '') ...[
                SvgPicture.asset(
                  Utils.iconPath(leftIcon!),
                ),
                const SizedBox(width: AppSize.size_14),
              ],
              Text(
                title,
                style: style ??
                    (isEnable
                        ? textStyleW600S16.copyWith(color: AppColors.white)
                        : textStyleW600S16.copyWith(
                            color: AppColors.neutral_400,
                          )),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
