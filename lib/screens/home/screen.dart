import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_app/constants/color.dart';
import 'package:tesla_app/constants/icons.dart';
import 'package:tesla_app/constants/images.dart';
import 'package:tesla_app/screens/home/components/information_card.dart';
import 'package:tesla_app/screens/home/components/status.dart';
import 'package:tesla_app/widgets/button.dart';
import 'package:tesla_app/widgets/scaffold.dart';
import 'package:tesla_app/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KScaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        isSelected: false,
                        iconPath: menuIcon,
                        onTap: () {},
                      ),
                      Column(
                        children: [
                          KText(
                            'Tesla',
                            fontSize: 18.sp,
                            color: darkText,
                          ),
                          KText(
                            'Cybertruck',
                            color: lightText,
                            fontSize: 18.sp,
                            isNeumorphic: true,
                            fontWeight: FontWeight.w900,
                          )
                        ],
                      ),
                      CustomButton(
                        isSelected: false,
                        iconPath: profileIcon,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 60.h),
                  child: Image.asset(carFront),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 44.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: KText(
                          'Status',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: lightText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 50.h),
                        child: Row(
                          children: [
                            status(
                                iconPath: 'battery',
                                title: 'Battery',
                                detail: '54%'),
                            status(
                                iconPath: 'range',
                                title: 'Range',
                                detail: '297 km'),
                            status(
                                iconPath: 'temperature',
                                title: 'Temperature',
                                detail: '27 °C'),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              'Information',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w900,
                              color: lightText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 34.h),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 44.w,
                        ),
                        const InformationCard(
                          bgPath: 'engine',
                          title: 'Engine',
                          details: 'Sleeping mode',
                        ),
                        const InformationCard(
                          bgPath: 'climate',
                          title: 'Climate',
                          details: 'A/C is ON',
                        ),
                        const InformationCard(
                          bgPath: 'engine',
                          title: 'Tires',
                          details: 'Low pressure',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 440.h,
              left: 180.w,
              right: 180.w,
              child: Column(
                children: [
                  CustomButton(
                    height: 120.h,
                    isSelected: true,
                    width: 120.h,
                    isReactive: false,
                    iconPath: lockIcon,
                    iconWidth: 70.w,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: KText(
                      'Tap to close the car',
                      fontSize: 18.sp,
                      color: lightText,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
                snap: true,
                maxChildSize: 0.9,
                initialChildSize: 0.075,
                minChildSize: 0.05,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Neumorphic(
                    style: NeumorphicStyle(
                        color: scaffoldBg2,
                        depth: 1,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r))),
                        border: const NeumorphicBorder(
                            width: 2, color: scaffoldBg1)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              /*onVerticalDragDown: (DragDownDetails details){
                                },*/
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Container(
                                  width: 60.w,
                                  height: 5.h,
                                  color: const Color(0xff17181C),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(),
                              CustomButton(
                                height: 80.h,
                                isSelected: true,
                                width: 80.h,
                                isReactive: true,
                                iconPath: powerIcon,
                                iconWidth: 70.w,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
