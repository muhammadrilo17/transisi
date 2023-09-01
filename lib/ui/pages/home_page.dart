import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_margin.dart';
import 'package:transisi_apps/core/utils/res/app_padding.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/core/utils/utils.dart';
import 'package:transisi_apps/ui/bloc/home/home_cubit.dart';
import 'package:transisi_apps/ui/widgets/input_text_border_custom.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController searchInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().init();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              AppBar(
                backgroundColor: AppColors.beige,
                title: Text(
                  AppString.appTitle,
                  style: textStyleW600S16.copyWith(),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppMargin.margin_16,
                        vertical: AppMargin.margin_8),
                    child: InkWell(
                      onTap: () {
                        context.read<HomeCubit>().openSearch();
                      },
                      child: Icon(
                        state.status == HomeStatus.onSearch
                            ? Icons.cancel
                            : Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
              if (state.status == HomeStatus.onSearch) ...[
                Container(
                  margin: const EdgeInsets.all(AppSize.size_16),
                  child: Row(
                    children: [
                      Expanded(
                        child: InputTextBorderCustom(
                          textEditingController: searchInput,
                          textHint: AppString.searchByName,
                        ),
                      ),
                      const SizedBox(width: AppSize.size_8),
                      InkWell(
                        child: const Icon(Icons.send_sharp),
                        onTap: () {
                          context.read<HomeCubit>().search(searchInput.text);
                        },
                      ),
                    ],
                  ),
                ),
              ],
              Expanded(
                child: state.status == HomeStatus.success
                    ? ListView.builder(
                        itemCount: state.employeesSearched?.length,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.padding_8,
                        ),
                        itemBuilder: (context, index) {
                          return itemEmployee(
                            context,
                            state.employeesSearched![index],
                          );
                        },
                      )
                    : state.status == HomeStatus.onSearch
                        ? Container()
                        : Center(
                            child: state.status == HomeStatus.failure
                                ? Container(
                                    margin: const EdgeInsets.all(
                                      AppSize.size_16,
                                    ),
                                    child: Text(
                                      Utils.getExceptionMessage(
                                        state.exception ?? Exception(),
                                      ),
                                      style: textStyleW500S14,
                                    ),
                                  )
                                : const CircularProgressIndicator(
                                    color: AppColors.brown,
                                  ),
                          ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.beige,
        onPressed: () {
          context.read<HomeCubit>().moveToAddEmployeePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget itemEmployee(BuildContext context, EmployeeModel employeeModel) {
    return Container(
      height: AppSize.size_80,
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.margin_8,
        horizontal: AppMargin.margin_16,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral_200),
      ),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          context
              .read<HomeCubit>()
              .moveToDetailEmployeePage(context, employeeModel.id);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              employeeModel.avatar,
              height: AppSize.size_80,
              width: AppSize.size_80,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.padding_8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${employeeModel.firstName} ${employeeModel.lastName}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(employeeModel.email, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
