import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_radius.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/core/utils/utils.dart';

class InputTextBorderCustom extends StatelessWidget {
  final String? iconName;
  final String textHint;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  const InputTextBorderCustom({
    Key? key,
    this.iconName,
    this.textHint = AppString.fillField,
    this.obscureText = false,
    this.textEditingController,
    this.autofillHints,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.size_14,
        horizontal: AppSize.size_8,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.radius_8),
        ),
        border: Border.all(
          color: AppColors.neutral_200,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconName != null
              ? SvgPicture.asset(
                  Utils.iconPath(iconName!),
                  height: AppSize.size_20,
                  width: AppSize.size_20,
                )
              : Container(),
          SizedBox(width: (iconName != null) ? AppSize.size_8 : 0),
          Expanded(
            child: TextFormField(
              autofillHints: autofillHints,
              controller: textEditingController,
              keyboardType: keyboardType,
              obscureText: obscureText,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintText: textHint,
                border: InputBorder.none,
                hintStyle: textStyleW500S14.copyWith(
                  color: AppColors.neutral_400,
                ),
              ),
              style: textStyleW500S16.copyWith(color: AppColors.neutral_700),
            ),
          ),
        ],
      ),
    );
  }
}
