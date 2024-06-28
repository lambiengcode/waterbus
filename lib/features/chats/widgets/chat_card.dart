import 'package:flutter/material.dart';

import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

import 'package:waterbus/core/app/colors/app_color.dart';
import 'package:waterbus/features/chats/widgets/avatar_chat.dart';
import 'package:waterbus/features/chats/xmodels/chat_model.dart';
import 'package:waterbus/gen/assets.gen.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chatModel;
  const ChatCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            AvatarChat(chatModel: chatModel),
            Visibility(
              visible: !chatModel.isGroup,
              child: Positioned(
                right: 6.sp,
                top: 2.sp,
                child: Container(
                  padding: EdgeInsets.all(1.2.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Container(
                    height: 7.sp,
                    width: 7.sp,
                    decoration: const BoxDecoration(
                      color: colorGreenLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10.sp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(text: chatModel.title),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: chatModel.statusMessage == StatusMessage.none,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: TextStyle(
                          color: fCL,
                          fontSize: 10.sp,
                        ),
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.sp),
                              child: Icon(
                                chatModel.statusLastedMessage ==
                                        StatusSeenMessage.seen
                                    ? PhosphorIcons.checks_bold
                                    : PhosphorIcons.check_bold,
                                color: chatModel.statusLastedMessage ==
                                        StatusSeenMessage.seen
                                    ? colorGreenLight
                                    : fCL,
                                size: 12.sp,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: chatModel.dateTime,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.sp),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: TextStyle(
                          color: mCL,
                          fontSize: 11.sp,
                        ),
                        children: [
                          TextSpan(
                            text: chatModel.typing
                                ? '${chatModel.title} '
                                : chatModel.isGroup
                                    ? 'Jerry: '
                                    : '',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          TextSpan(
                            text: chatModel.typing
                                ? 'is typing...'
                                : chatModel.statusMessage == StatusMessage.none
                                    ? chatModel.lastestMessage
                                    : '6m : 32sec',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  chatModel.statusMessage == StatusMessage.none &&
                          chatModel.countUnreadMessage != 0 &&
                          !chatModel.typing
                      ? Container(
                          margin: chatModel.countUnreadMessage > 9
                              ? EdgeInsets.symmetric(
                                  vertical: 3.sp,
                                )
                              : null,
                          padding: chatModel.countUnreadMessage > 9
                              ? EdgeInsets.symmetric(
                                  horizontal: 5.sp,
                                  vertical: 2.sp,
                                )
                              : EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            shape: chatModel.countUnreadMessage > 9
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: chatModel.countUnreadMessage > 9
                                ? BorderRadius.circular(15.sp)
                                : null,
                          ),
                          child: Text(
                            chatModel.countUnreadMessage.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 19.sp,
                        ),
                ],
              ),
            ],
          ),
        ),
        chatModel.statusMessage == StatusMessage.endCall
            ? Row(
                children: [
                  Image.asset(
                    Assets.icons.icEndCall.path,
                    color: colorRedTitle,
                    height: 15.sp,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    'End Call',
                    style: TextStyle(
                      color: colorRedTitle,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
