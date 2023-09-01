import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';
import 'package:transisi_apps/core/utils/date_time_formatter.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/core/utils/utils.dart';
import 'package:transisi_apps/ui/bloc/add/add_employee_cubit.dart';
import 'package:transisi_apps/ui/widgets/button_filled_custom.dart';
import 'package:transisi_apps/ui/widgets/input_text_border_custom.dart';

class AddEmployeePage extends StatelessWidget {
  AddEmployeePage({super.key});

  final TextEditingController nameInput = TextEditingController();
  final TextEditingController jobInput = TextEditingController();

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
      body: BlocConsumer<AddEmployeeCubit, AddEmployeeState>(
        listener: (context, state) {
          if (state.status == AddEmployeeStatus.success) {
            _showDialog(
              context,
              AppString.success,
              AppString.successMessage,
              employeeModel: state.employees,
            );
          } else if (state.status == AddEmployeeStatus.failure) {
            _showDialog(
              context,
              AppString.failed,
              Utils.getExceptionMessage(state.exception ?? Exception()),
            );
          }
        },
        builder: (context, state) {
          return Column(
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
                child: InputTextBorderCustom(
                  textEditingController: nameInput,
                ),
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
                child: InputTextBorderCustom(
                  textEditingController: jobInput,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(AppSize.size_16),
                child: ButtonFilledCustom(
                  onTap: () {
                    if (nameInput.text.isEmpty) {
                      context
                          .read<AddEmployeeCubit>()
                          .setFailed(AppString.nameCannotEmpty);
                    } else if (jobInput.text.isEmpty) {
                      context
                          .read<AddEmployeeCubit>()
                          .setFailed(AppString.jobCannotEmpty);
                    } else {
                      context.read<AddEmployeeCubit>().addEmployee(
                            nameInput.text,
                            jobInput.text,
                          );
                    }
                  },
                  isLoading: state.status == AddEmployeeStatus.loading,
                  title: AppString.addEmployee,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDialog(
    BuildContext context,
    String title,
    String message, {
    NewEmployeeModel? employeeModel,
  }) {
    String messageResult = message;
    if (employeeModel != null) {
      messageResult += '\n\nName: ${employeeModel.name}';
      messageResult += '\nJob: ${employeeModel.job}';
      messageResult += '\nID: ${employeeModel.id}';
      messageResult +=
          '\nCreated at: ${Utils.convertDateTime(DateTimeFormatter.generalFormatter, employeeModel.createdAt)}';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: textStyleW600S16),
          content: Text(messageResult, style: textStyleW500S14),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (title == AppString.success) {
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              },
              child: Text(
                AppString.ok,
                style: textStyleW500S12,
              ),
            ),
          ],
        );
      },
    );
  }
}
