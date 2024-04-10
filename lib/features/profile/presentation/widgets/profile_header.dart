// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/core/constants/constants.dart';
import 'package:waterbus/features/app/bloc/bloc.dart';
import 'package:waterbus/features/auth/domain/entities/user.dart';
import 'package:waterbus/features/profile/presentation/bloc/user_bloc.dart';
import 'package:waterbus/features/profile/presentation/widgets/avatar_card.dart';
import 'package:waterbus/features/systems/bloc/themes/theme_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        AppBloc.themeBloc.add(
                          OnChangeTheme(
                            themeMode:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ThemeMode.light
                                    : ThemeMode.dark,
                          ),
                        );
                      },
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? PhosphorIcons.moon_stars_fill
                            : PhosphorIcons.sun_dim_fill,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).primaryColor
                            : Colors.orangeAccent,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 12.sp),
            Text(
              user.fullName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              '@${user.userName}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 10.sp,
                  ),
            ),
          ],
        );
      },
    );
  }
}
