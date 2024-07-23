import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/repeted/error_text.dart';
import 'package:hosptel_app/features/health/presentation/cubit/user_amount_bloc/user_amount_bloc.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/empty_account_mony.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/money_account_body.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/png_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/titel_pages_widget.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';

class MonyAccountPage extends StatelessWidget {
  const MonyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<UserAmountBloc>()
            .add(const GetUserAmount(isRefresh: true));
      },
      child: MainBackGround(
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              TitlePageWidget(
                titleText: AppWordManger.finisialAccount,
                onTap: () => Navigator.pop(context),
                paddingBottome: 15.h,
              ),
              //? Image Account :
              Image.asset(
                width: 100.w,
                height: 100.h,
                AppPngManger.imageProfile,
              ),
              //? NAME :
              TextUtiels(
                text: AppSharedPreferences.getName(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 20.sp,
                      color: AppColorManger.textColor2,
                    ),
              ),
              //? Number Phone
              TextUtiels(
                text: AppSharedPreferences.getNumber(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 20.sp,
                      color: AppColorManger.lightText,
                    ),
              ),
              BlocConsumer<UserAmountBloc, UserAmountState>(
                listener: (context, state) {
                  HealthLogic()
                      .patientAmountListener(context, state, controller);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.done) {
                    if (state.items.isEmpty) {
                      return const EmptyMonyAccountWidget();
                    } else {
                      return MoneyAccountBody(
                        items: state.items,
                        controller: controller,
                        hasReachedMax: state.hasReachedMax,
                        userAmount: state.userAmount,
                      );
                    }
                  } else if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return ErrorTextWidget(
                      text: state.failureMessage.message,
                      onPressed: () {
                        context
                            .read<UserAmountBloc>()
                            .add(const GetUserAmount(isRefresh: true));
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
