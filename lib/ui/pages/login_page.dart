import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:transisi_apps/core/utils/res/app_colors.dart';
import 'package:transisi_apps/core/utils/res/app_icons.dart';
import 'package:transisi_apps/core/utils/res/app_margin.dart';
import 'package:transisi_apps/core/utils/res/app_padding.dart';
import 'package:transisi_apps/core/utils/res/app_size.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/core/utils/res/text_style.dart';
import 'package:transisi_apps/ui/bloc/login/login_cubit.dart';
import 'package:transisi_apps/ui/widgets/button_filled_custom.dart';
import 'package:transisi_apps/ui/widgets/input_text_border_custom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginCubit _loginCubit = GetIt.instance<LoginCubit>();

  final TextEditingController _emailOrUsername = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.read<LoginCubit>().moveToMainPage(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.padding_16),
              child: Column(
                children: [
                  const SizedBox(height: AppSize.size_80),
                  Text(AppString.appTitle, style: textStyleW700S20),
                  const SizedBox(height: AppSize.size_16),
                  Text(
                    AppString.appDescription,
                    style: textStyleW500S12.copyWith(
                      color: AppColors.neutral_800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSize.size_116),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppString.username,
                      style: textStyleW500S16.copyWith(
                        color: AppColors.neutral_600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: AppSize.size_8),
                  InputTextBorderCustom(
                    autofillHints: const [AutofillHints.email],
                    textEditingController: _emailOrUsername,
                    iconName: AppIcons.profile,
                    textHint: AppString.username,
                  ),
                  const SizedBox(height: AppSize.size_16),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppString.password,
                      style: textStyleW500S16.copyWith(
                        color: AppColors.neutral_600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: AppSize.size_8),
                  InputTextBorderCustom(
                    autofillHints: const [AutofillHints.password],
                    textEditingController: _password,
                    iconName: AppIcons.password,
                    textHint: AppString.password,
                    obscureText: true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: AppMargin.margin_8,
                      bottom: AppMargin.margin_74,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.status == LoginStatus.failure) ...[
                          Expanded(
                            child: Text(
                              state.message ?? '',
                              style: textStyleW400S12.copyWith(
                                color: AppColors.red_600,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSize.size_8),
                        ],
                        Text(
                          AppString.forgotPassword,
                          style: textStyleW500S12,
                        ),
                      ],
                    ),
                  ),
                  ButtonFilledCustom(
                    title: AppString.enter,
                    style: textStyleW600S16.copyWith(
                      color: AppColors.white,
                    ),
                    isLoading: state.status == LoginStatus.loading,
                    onTap: () {
                      _loginCubit.login(_emailOrUsername.text, _password.text);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
