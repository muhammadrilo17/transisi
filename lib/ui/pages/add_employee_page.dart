import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/ui/widgets/button_filled_custom.dart';
import 'package:transisi_apps/ui/widgets/input_text_border_custom.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.addEmployee,
          style: textStyleW600S16,
        ),
        backgroundColor: AppColors.beige,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppSize.size_8,
              horizontal: AppSize.size_16,
            ),
            child: Text(
              AppString.name,
              style: textStyleW500S14.copyWith(
                color: AppColors.neutral_600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSize.size_16),
            child: InputTextBorderCustom(),
          ),
          const SizedBox(height: AppSize.size_8),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppSize.size_8,
              horizontal: AppSize.size_16,
            ),
            child: Text(
              AppString.job,
              style: textStyleW500S14.copyWith(
                color: AppColors.neutral_600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSize.size_16),
            child: InputTextBorderCustom(),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(AppSize.size_16),
            child: const ButtonFilledCustom(
              title: AppString.addEmployee,
            ),
          ),
        ],
      ),
    );
  }
}
