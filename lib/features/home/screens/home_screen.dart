// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/core/navigator/app_navigator.dart';
import 'package:waterbus/core/navigator/app_routes.dart';
import 'package:waterbus/core/utils/appbar/app_bar_title_back.dart';
import 'package:waterbus/core/utils/cached_network_image/cached_network_image.dart';
import 'package:waterbus/core/utils/gesture/gesture_wrapper.dart';
import 'package:waterbus/features/app/widgets/app_drawer.dart';
import 'package:waterbus/features/home/widgets/enter_code_box.dart';
import 'package:waterbus/features/home/widgets/invitation_list.dart';
import 'package:waterbus/features/home/widgets/my_meetings.dart';
import 'package:waterbus/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _sliderDrawerKey.currentState?.animationController.addListener(() {
      _isDrawerOpen = _sliderDrawerKey.currentState!.isDrawerOpen;

      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDrawer(
        sliderDrawerKey: _sliderDrawerKey,
        appBar: appBarTitleBack(
          context,
          '',
          centerTitle: false,
          isVisibleBackButton: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleWidget: _isDrawerOpen
              ? const SizedBox()
              : Row(
                  children: [
                    SizedBox(width: 6.sp),
                    GestureWrapper(
                      onTap: () {
                        _sliderDrawerKey.currentState?.toggle();
                      },
                      child: CustomNetworkImage(
                        height: 30.sp,
                        width: 30.sp,
                        urlToImage:
                            'https://avatars.githubusercontent.com/u/60530946?v=4',
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kai Dao",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          "Senior at Waterbus",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 10.sp,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
          actions: [
            Container(
              width: 36.sp,
              height: 36.sp,
              margin: EdgeInsets.only(right: 16.sp),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.centerRight,
              child: Image.asset(
                Assets.icons.icNewMeeting.path,
                height: 22.sp,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
        body: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(height: 16.sp),
              EnterCodeBox(
                onTap: () {
                  AppNavigator.push(Routes.enterCodeRoute);
                },
              ),
              SizedBox(height: 16.sp),
              const Divider(thickness: .3, height: .3),
              SizedBox(height: 10.sp),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      InvitationList(),
                      MyMeetings(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
