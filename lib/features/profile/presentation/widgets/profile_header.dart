// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:waterbus/core/app/datasource/settings_manager_datasource.dart';
import 'package:waterbus/core/app/lang/data/data_languages.dart';

// Project imports:
import 'package:waterbus/core/constants/constants.dart';
import 'package:waterbus/core/navigator/app_navigator.dart';
import 'package:waterbus/core/navigator/app_routes.dart';
import 'package:waterbus/features/app/bloc/bloc.dart';
import 'package:waterbus/core/app/themes/bloc/themes_bloc.dart';
import 'package:waterbus/features/auth/domain/entities/user.dart';
import 'package:waterbus/features/profile/presentation/bloc/user_bloc.dart';
import 'package:waterbus/features/profile/presentation/widgets/avatar_card.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  final String? appTheme = SettingsManagerDatasourceImpl().getTheme();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final User user = state is UserGetDone ? state.user : kUserDefault;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarCard(
                  urlToImage: user.avatar,
                  size: 26.sp,
                ),
                _buildIconHeader(context),
              ],
            ),
            SizedBox(height: 12.sp),
            Text(
              user.fullName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
            ),
            Text(
              '@${user.userName}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 10.sp, color: Colors.white),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIconHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            AppNavigator.push(Routes.changeLanguage);
          },
          icon: Image.asset(
            Strings.countryflags.i18n,
            height: 20.sp,
          ),
        ),
        IconButton(
          onPressed: () {
            AppBloc.themesBloc.add(OnChangeTheme(appTheme: appTheme));
          },
          icon: appTheme == ThemeList.dark
              ? Icon(
                  PhosphorIcons.moon_stars_fill,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(
                  PhosphorIcons.sun_fill,
                  color: Theme.of(context).primaryColorLight,
                ),
        ),
      ],
    );
  }
}
