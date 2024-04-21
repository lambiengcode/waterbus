// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/core/app/lang/data/data_languages.dart';
import 'package:waterbus/core/constants/constants.dart';
import 'package:waterbus/core/navigator/app_navigator.dart';
import 'package:waterbus/core/navigator/app_routes.dart';
import 'package:waterbus/core/utils/appbar/app_bar_title_back.dart';
import 'package:waterbus/core/utils/gesture/gesture_wrapper.dart';
import 'package:waterbus/features/auth/domain/entities/user.dart';
import 'package:waterbus/features/chats/widgets/chat_card.dart';
import 'package:waterbus/features/chats/xmodels/chat_model.dart';
import 'package:waterbus/features/conversation/screens/conversation_screen.dart';
import 'package:waterbus/features/home/widgets/enter_code_box.dart';
import 'package:waterbus/features/profile/presentation/bloc/user_bloc.dart';
import 'package:waterbus/features/profile/presentation/widgets/avatar_card.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  ChatModel? _currentChat;

  void _handleTapChatItem(ChatModel chatModel) {
    if (SizerUtil.isDesktop) {
      setState(() {
        _currentChat = chatModel;
      });
    } else {
      AppNavigator().push(
        Routes.conversationRoute,
        arguments: {
          'chatModel': chatModel,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizerUtil.isDesktop ? 30.w : 100.w,
          child: Scaffold(
            appBar: appBarTitleBack(
              context,
              title: Strings.chat.i18n,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  final User user =
                      state is UserGetDone ? state.user : kUserDefault;

                  return Align(
                    alignment: Alignment.centerRight,
                    child: AvatarCard(
                      urlToImage: user.avatar,
                      size: 24.sp,
                    ),
                  );
                },
              ),
              actions: [
                Tooltip(
                  message: Strings.createRoom.i18n,
                  child: IconButton(
                    onPressed: () {
                      AppNavigator().push(Routes.createMeetingRoute);
                    },
                    icon: Icon(
                      PhosphorIcons.plus,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(height: 10.sp),
                EnterCodeBox(
                  hintTextContent: Strings.search.i18n,
                  onTap: () {},
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listFakeChat.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 60.sp, top: 8.sp),
                    itemBuilder: (context, index) {
                      return GestureWrapper(
                        onTap: () {
                          _handleTapChatItem(listFakeChat[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.sp,
                            vertical: 4.sp,
                          ),
                          color: SizerUtil.isDesktop &&
                                  _currentChat == listFakeChat[index]
                              ? Colors.black87
                              : Colors.transparent,
                          child: ChatCard(
                            chatModel: listFakeChat[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (SizerUtil.isDesktop)
          VerticalDivider(
            width: 1.sp,
            thickness: 1.sp,
          ),
        Expanded(
          child: _currentChat != null
              ? ConversationScreen(chatModel: _currentChat!)
              : const SizedBox(),
        ),
      ],
    );
  }
}
