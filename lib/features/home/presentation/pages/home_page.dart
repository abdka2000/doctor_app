import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/home/domain/entity/doctor_info_entity/doctor_info_entity.dart';
import 'package:hosptel_app/features/home/presentation/cubit/doctor_info/doctor_info_cubit.dart';
import 'package:hosptel_app/features/home/presentation/logic/home_logic.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/doctor_info_error.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/home_loading_shimmer.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import '../../../../core/class/clipping_path_class.dart';
import '../../../../core/function/navigation_funcation.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/enum_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/svg_manger.dart';
import '../../../../core/resources/word_manger.dart';
import '../../../../core/widget/main/back_ground_main/back_ground_main.dart';
import '../../../../core/widget/repeted/error_text.dart';
import '../../../../core/widget/text_utiles/text_utile_widget.dart';
import '../cubit/advertisement/advertisement_cubit.dart';
import '../cubit/services/services_cubit.dart';
import '../widgets/home_primary/caption_text_widget.dart';
import '../widgets/home_primary/info_doctor_widget.dart';
import '../widgets/home_primary/info_services_widget.dart';
import '../widgets/home_primary/info_tipa_news_widget.dart';
import '../widgets/home_primary/reservation_now_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getPersonData();
  }

  Future<void> refresh() async {
    context.read<DoctorInfoCubit>().getDoctorInfo();
    context.read<ProfileCubit>().getPersonData();
    context.read<ServicesCubit>().getServices(isRefresh: true);
    context.read<AdvertisementCubit>().getAdvertisement();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return RefreshIndicator(
      onRefresh: () => refresh(),
      child: DoubleBackToExitWidget(
          backgroundColor: AppColorManger.primaryColor,
          behavior: SnackBarBehavior.floating,
          width: 280.w,
          padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
          snackBarMessage: AppWordManger.preesAnotherForExit,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
              ),
          child: MainBackGround(
            mainBody: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<DoctorInfoCubit, DoctorInfoState>(
                    builder: (context, state) {
                      if (state.status == DeafultBlocStatus.done) {
                        return HomePageDoctorInfo(
                          doctorInfo: state.info,
                        );
                      } else if (state.status == DeafultBlocStatus.loading) {
                        return const HomeLoadingShimmer();
                      }
                      return DoctorInfoError(
                          text: state.failureMessage.message,
                          onPressed: () {
                            context.read<ProfileCubit>().getPersonData();
                            context.read<DoctorInfoCubit>().getDoctorInfo();
                          });
                    },
                  ),
                  //?api :
                  SizedBox(height: 18.h),
                  //? Services :
                  const CaptionTextWidget(
                    text: AppWordManger.services,
                  ),
                  //? api this is :
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                    ),
                    child: BlocConsumer<ServicesCubit, ServicesState>(
                      listener: (context, state) {
                        HomeLogic()
                            .servicesListener(context, state, controller);
                      },
                      builder: (context, state) {
                        if (state.status == DeafultBlocStatus.done) {
                          if (state.services.isNotEmpty) {
                            return InfoServicesWidget(
                              controller: controller,
                              hasReachedMax: state.hasReachedMax,
                              items: state.services,
                            );
                          } else {
                            return const Center(
                              child: TextUtiels(text: 'لا يوجد خدمات حاليا'),
                            );
                          }
                        } else if (state.status == DeafultBlocStatus.loading) {
                          return MainLoadignWidget(
                            height: 160.h,
                          );
                        } else {
                          return ErrorTextWidget(
                            isScrollable: false,
                            text: state.failureMessage.message,
                            height: 160.h,
                            onPressed: () => context
                                .read<ServicesCubit>()
                                .getServices(isRefresh: true),
                          );
                        }
                      },
                    ),
                  ),
                  //?
                  const CaptionTextWidget(
                    text: AppWordManger.tipsAndNews,
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: BlocBuilder<AdvertisementCubit, AdvertisementState>(
                      builder: (context, state) {
                        if (state.status == DeafultBlocStatus.done) {
                          if (state.advs.isNotEmpty) {
                            return InfoTipasNewsWidget(
                              advs: state.advs,
                            );
                          } else {
                            return const Center(
                              child: TextUtiels(text: 'لا يوجد نصائح حاليا'),
                            );
                          }
                        } else if (state.status == DeafultBlocStatus.loading) {
                          return MainLoadignWidget(
                            height: 170.h,
                          );
                        } else {
                          return ErrorTextWidget(
                            isScrollable: false,
                            text: state.failureMessage.message,
                            height: 170.h,
                            onPressed: () => context
                                .read<AdvertisementCubit>()
                                .getAdvertisement(),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 60.h)
                ],
              ),
            ),
          )),
    );
  }
}

class HomePageDoctorInfo extends StatelessWidget {
  const HomePageDoctorInfo({super.key, required this.doctorInfo});
  final DoctorInfoEntity doctorInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColorManger.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'http://${doctorInfo.result?.personalImageUrl ?? ''}',
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //? api this text not static :
                      StrokeText(
                        text: (doctorInfo.result?.doctorName == null ||
                                (doctorInfo.result?.doctorName?.isEmpty ??
                                    true))
                            ? "Doctor Name"
                            : doctorInfo.result!.doctorName!,
                        textStyle: TextStyle(
                          fontSize: AppFontSizeManger.s24,
                          fontFamily: AppFontFamily.extraBold,
                          color: AppColorManger.white,
                        ),
                        strokeColor: AppColorManger.secoundryColor,
                        strokeWidth: 4.2,
                        textColor: AppColorManger.white,
                      ),
                      //? api this text not static :
                      TextUtiels(
                        text: (doctorInfo.result?.specialization == null ||
                                (doctorInfo.result?.specialization?.isEmpty ??
                                    true))
                            ? 'Doctor Specialization'
                            : doctorInfo.result!.specialization!,
                        fontFamily: AppFontFamily.tajawalRegular,
                        color: AppColorManger.offWhite,
                        fontSize: AppFontSizeManger.s12,
                      ),
                      SizedBox(height: 9.h),
                      //? api this text not static :
                      InfoDoctor(
                        icon: AppSvgManger.iconPhone,
                        text: (doctorInfo.result?.phoneNumber == null ||
                                (doctorInfo.result?.phoneNumber?.isEmpty ??
                                    true))
                            ? '0000000000'
                            : doctorInfo.result?.phoneNumber,
                      ),
                      SizedBox(height: 8.h),
                      InfoDoctor(
                        icon: AppSvgManger.iconLocation,
                        text: (doctorInfo.result?.address == null ||
                                (doctorInfo.result?.address?.isEmpty ?? true))
                            ? 'address'
                            : doctorInfo.result!.address!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 170,
                  height: 200,
                ),
                // CachedNetworkImage(
                //   imageUrl:
                //       'http://${doctorInfo.result?.personalImageUrl ?? ''}',
                //   width: 200,
                //   height: 200,
                //   errorWidget: (context, url, error) => Icon(
                //     Icons.error_outline,
                //     color: AppColorManger.colorButtonShowDailog,
                //   ),
                // )
              ],
            ),
          ),
        ),

        //? button reservation Now :
        GestureDetector(
          onTap: () {
            isGuestOrUserForReservation(context);
          },
          child: const ReservationNowButtonWidget(
            text: AppWordManger.reservationNow,
          ),
        ),
        SizedBox(height: 15.h),
        //? about doctor label :
        const CaptionTextWidget(
          text: AppWordManger.aboutDoctor,
        ),
        SizedBox(height: 18.h),
        //? about doctor text <Api>:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
          child: TextUtiels(
            text: (doctorInfo.result?.introduction == null ||
                    (doctorInfo.result?.introduction?.isEmpty ?? true))
                ? "لا يوجد نص حالياً"
                : doctorInfo.result!.introduction!,
            fontFamily: AppFontFamily.tajawalRegular,
            color: AppColorManger.textColor1,
            fontSize: AppFontSizeManger.s13,
            height: 1.5.h,
          ),
        ),
      ],
    );
  }
}
