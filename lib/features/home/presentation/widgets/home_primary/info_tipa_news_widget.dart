// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/svg_manger.dart';
import '../../../../../core/widget/text_utiles/text_utile_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../domain/entity/doctor_adv/adv_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoTipasNewsWidget extends StatefulWidget {
  const InfoTipasNewsWidget({Key? key, required this.advs}) : super(key: key);
  final List<AdvItem> advs;
  @override
  InfoTipasNewsWidgetState createState() => InfoTipasNewsWidgetState();
}

class InfoTipasNewsWidgetState extends State<InfoTipasNewsWidget> {
  late CarouselController _pageController;
  int currentIndex = 0;
  int dotIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          //? Option :
          options: CarouselOptions(
            height: 170.h,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
                if (dotIndex == 3)
                  dotIndex = 0;
                else
                  dotIndex++;
              });
            },
          ),
          carouselController: _pageController,
          itemCount: widget.advs.length,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 170.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                    color: AppColorManger.fillColorCard,
                    borderRadius: BorderRadius.circular(15),
                    border: Border(
                      bottom: BorderSide(
                        color: AppColorManger.primaryColor,
                        width: 1.7,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColorManger.shadowColor,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      TextUtiels(
                        paddingRight: 65.w,
                        text: widget.advs[index].title!,
                        fontFamily: AppFontFamily.tajawalBold,
                        color: AppColorManger.primaryColor,
                        fontSize: AppFontSizeManger.s16,
                        // height: 3.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 165.w,
                            height: 50.h,
                            child: SingleChildScrollView(
                              child: TextUtiels(
                                paddingLeft: 30.w,
                                text: widget.advs[index].description!,
                                fontFamily: AppFontFamily.tajawalRegular,
                                color: AppColorManger.textColor1,
                                fontSize: AppFontSizeManger.s10,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //? Icon :
                Positioned(
                  right: -12.w,
                  top: 38.h,
                  child: SvgPicture.asset(
                    width: 80.w,
                    height: 80.h,
                    AppSvgManger.iconLight,
                  ),
                )
              ],
            );
          },
        ),
        SizedBox(height: 30.h),

        //? Scroll Smooth :
        AnimatedSmoothIndicator(
          activeIndex: dotIndex,
          count: 4,
          effect: JumpingDotEffect(
            spacing: 8,
            dotWidth: 50.w,
            dotHeight: 5.h,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            activeDotColor: AppColorManger.primaryColor,
          ),
          // onDotClicked: (index) {
          //   _pageController.animateToPage(
          //     index,
          //     duration: const Duration(milliseconds: 500),
          //     curve: Curves.ease,
          //   );
          // },
        ),
      ],
    );
  }
}
