// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/core/constants/constants.dart';
import 'package:waterbus/core/navigator/app_navigator.dart';
import 'package:waterbus/core/navigator/app_routes.dart';
import 'package:waterbus/core/utils/appbar/app_bar_title_back.dart';
import 'package:waterbus/core/utils/gesture/gesture_wrapper.dart';
import 'package:waterbus/core/utils/permission_handler.dart';
import 'package:waterbus/features/app/bloc/bloc.dart';
import 'package:waterbus/features/auth/domain/entities/user.dart';
import 'package:waterbus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waterbus/features/common/widgets/dialogs/dialog_loading.dart';
import 'package:waterbus/features/home/widgets/enter_code_box.dart';
import 'package:waterbus/features/home/widgets/recent_meetings.dart';
import 'package:waterbus/features/profile/presentation/bloc/user_bloc.dart';
import 'package:waterbus/features/profile/presentation/widgets/avatar_card.dart';
import 'package:waterbus/features/profile/presentation/widgets/profile_drawer_layout.dart';
import 'package:waterbus/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SlidingDrawerState> _sideMenuKey =
      GlobalKey<SlidingDrawerState>();

  void _toggleDrawer() {
    if (SizerUtil.isDesktop) return;

    _sideMenuKey.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness ==
                (Platform.isAndroid ? Brightness.dark : Brightness.light)
            ? Brightness.light
            : Brightness.dark,
        statusBarIconBrightness: Theme.of(context).brightness ==
                (Platform.isAndroid ? Brightness.dark : Brightness.light)
            ? Brightness.light
            : Brightness.dark,
      ),
      child: SlidingDrawer(
        key: _sideMenuKey,
        ignorePointer: SizerUtil.isDesktop,
        drawerBuilder: (_) =>
            SizerUtil.isDesktop ? const SizedBox() : _buildDrawable(context),
        contentBuilder: (_) => Scaffold(
          appBar: SizerUtil.isDesktop
              ? null
              : appBarTitleBack(
                  context,
                  centerTitle: false,
                  isVisibleBackButton: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  titleWidget: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      final User user =
                          state is UserGetDone ? state.user : kUserDefault;

                      return Row(
                        children: [
                          SizedBox(width: 6.sp),
                          GestureDetector(
                            onTap: _toggleDrawer,
                            child: AvatarCard(
                              urlToImage: user.avatar,
                              size: 30.sp,
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user.fullName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                '@${user.userName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 10.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  actions: [_buildCreateMeetingButton],
                ),
          body: Row(
            children: [
              ...(SizerUtil.isDesktop
                  ? [
                      SizedBox(
                        width: 26.w,
                        child: _buildDrawable(context),
                      ),
                      VerticalDivider(
                        width: 1.sp,
                        thickness: 1.sp,
                      ),
                    ]
                  : []),
              Expanded(
                child: ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      SizedBox(height: 10.sp),
                      EnterCodeBox(
                        suffixWidget: SizerUtil.isDesktop
                            ? _buildCreateMeetingButton
                            : null,
                        onTap: () {
                          AppNavigator.push(Routes.enterCodeRoute);
                        },
                      ),
                      SizedBox(height: 12.sp),
                      const Expanded(
                        child: RecentMeetings(),
                      ),
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

  Widget _buildDrawable(BuildContext context) {
    return ProfileDrawerLayout(
      onTapItem: (item) {
        _toggleDrawer();

        Future.delayed(const Duration(milliseconds: 300), () {
          switch (item.title) {
            case "Logout":
              displayLoadingLayer();
              AppBloc.authBloc.add(LogOutEvent());
              break;
            case "Profile":
              AppNavigator.push(Routes.profileRoute);
              break;
            case "Settings":
              AppNavigator.push(Routes.settingsRoute);
              break;
            case "Licenses":
              showLicensePage(
                context: context,
                applicationIcon: Image.asset(
                  Assets.images.imgLogo.path,
                  height: 35.sp,
                ),
                applicationVersion: '1.1.1',
              );
              break;
            default:
              break;
          }
        });
      },
    );
  }

  Widget get _buildCreateMeetingButton {
    return GestureWrapper(
      onTap: () async {
        await WaterbusPermissionHandler().checkGrantedForExecute(
          permissions: [Permission.camera, Permission.microphone],
          callBack: () async {
            AppNavigator.push(Routes.createMeetingRoute);
          },
        );
      },
      child: Container(
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
    );
  }
}
