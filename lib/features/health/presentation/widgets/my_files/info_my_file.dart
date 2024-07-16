import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/user_file_entity/item.dart';
import 'package:hosptel_app/features/health/presentation/cubit/download_bloc/download_bloc.dart';
import 'package:hosptel_app/features/health/presentation/logic/health_logic.dart';
import 'package:hosptel_app/features/home/presentation/logic/home_logic.dart';
import 'package:intl/intl.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/injection/injection_container.dart' as di;

class InfoMyFileWidget extends StatelessWidget {
  const InfoMyFileWidget({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<DownloadBloc>(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //? Dowanload Icon :
          // BlocConsumer<DownloadCubit, DownloadState>(
          //   listener: (context, state) {
          //     HealthLogic().downloadFileListener(state, context);
          //   },
          //   builder: (context, state) => GestureDetector(
          //     onTap: () {
          //       MainShowDialog.customShowDialog(
          //         onTapBack: () {
          //           Navigator.pop(context);
          //         },
          //         context,
          //         firstButtonText: AppWordManger.yes,
          //         secoundButtonText: AppWordManger.no,
          //         textPopUp: AppWordManger.sureYouWantToDownload,
          //         onTapFirst: () => context.read<DownloadCubit>().downloadFile(
          //             url: item.fileUrl ?? '', name: item.fileName ?? ''),
          //         onTapSecound: () => Navigator.pop(context),
          //       );
          //     },
          // child:
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: BlocConsumer<DownloadBloc, DownloadState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                HealthLogic().downloadFileListener(state, context);
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    MainShowDialog.customShowDialog(
                      onTapBack: () {
                        Navigator.pop(context);
                      },
                      context,
                      firstButtonText: AppWordManger.yes,
                      secoundButtonText: AppWordManger.no,
                      textPopUp: AppWordManger.sureYouWantToDownload,
                      onTapFirst: () {
                        context.read<DownloadBloc>().add(DownloadFile(
                            url: item.fileUrl ?? '',
                            name: item.fileName ?? ''));
                      },
                      onTapSecound: () => Navigator.pop(context),
                    );
                  },
                  child: SvgPicture.asset(
                    width: 41.w,
                    height: 41.h,
                    AppSvgManger.iconDowanload,
                  ),
                );
              },
            ),
          ),
          //   ),
          // ),
          //? Ifno File :
          Container(
            width: 150.w,
            padding: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtiels(
                  text: item.fileName ?? '',
                  paddingBottome: 3.h,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
                SizedBox(
                  width: 130.w,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextUtiels(
                          text: DateFormat.jm()
                              .format(item.creationTime ?? DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 10.sp,
                              ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        TextUtiels(
                          text: DateFormat('yyyy/MM/dd')
                              .format(item.creationTime ?? DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 10.sp,
                              ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        TextUtiels(
                          text: '${item.fileSize} kB',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 10.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //? Icon File Or Image :
          SvgPicture.asset(
            width: 70.w,
            height: 70.h,
            AppSvgManger.iconFile,
          ),
        ],
      ),
    );
  }
}
