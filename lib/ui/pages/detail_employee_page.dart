import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_images.dart';
import 'package:transisi_apps/core/utils/res/app_radius.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/core/utils/utils.dart';
import 'package:transisi_apps/ui/bloc/detail/detail_employee_cubit.dart';

class DetailEmployeePage extends StatelessWidget {
  final int id;
  const DetailEmployeePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<DetailEmployeeCubit>().init(id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.beige,
        toolbarHeight: AppSize.size_200,
        flexibleSpace: BlocBuilder<DetailEmployeeCubit, DetailEmployeeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.size_20),
                BackButton(
                  color: AppColors.white,
                  onPressed: () => Navigator.pop(context),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    state.employees?.avatar ?? '',
                    errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        Utils.imagePath(AppImages.notFound),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '${state.employees?.firstName ?? '-'} ${state.employees?.lastName ?? ''}',
                    textAlign: TextAlign.center,
                    style: textStyleW600S16.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<DetailEmployeeCubit, DetailEmployeeState>(
        builder: (context, state) {
          if (state.status == DetailEmployeeStatus.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.brown,
            ));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.size_20),
                itemInformation(
                  AppString.firstNameLabel,
                  state.employees?.firstName ?? '-',
                ),
                itemInformation(
                  AppString.lastNameLabel,
                  state.employees?.lastName ?? '-',
                ),
                itemInformation(
                  AppString.emailLabel,
                  state.employees?.email ?? '-',
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget itemInformation(String label, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.size_16,
        vertical: AppSize.size_8,
      ),
      padding: const EdgeInsets.all(AppSize.size_8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral_200),
        borderRadius:
            const BorderRadius.all(Radius.circular(AppRadius.radius_8)),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: textStyleW600S16.copyWith(color: AppColors.neutral_800),
          ),
          Text(
            text,
            style: textStyleW600S16.copyWith(color: AppColors.neutral_800),
          ),
        ],
      ),
    );
  }
}
