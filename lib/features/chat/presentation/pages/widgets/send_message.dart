import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/features/chat/presentation/manager/chat_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({
    super.key,
    required this.controller,
    required ScrollController controller2,
  }) : _controller = controller2;

  final TextEditingController controller;

  final ScrollController _controller;

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, bottom: 10, top: 5),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.multiline,
            style: TextStyle(color: AppColors.black900),
            onChanged: (value) {
              setState(() {

              });
            },
            maxLines: 3,
            minLines: 1,
            autocorrect: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
              //filled: true,
              // /fillColor:Colors.blueGrey.withOpacity(0.1),
              hintText: AppStrings.sendMessage,
              prefixIcon: IconButton(
                alignment: Alignment.bottomCenter,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.whiteA700,
                    builder: (context) => BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<ChatCubit>()
                                            .pickImageFile();
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.image,
                                        color:
                                            AppColors.primary.withOpacity(.9),
                                        size: 50,
                                      )),
                                  Text(
                                    "صورة",
                                    style: CustomTextStyles.bodyLargeBlack900,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context.read<ChatCubit>().pickFile();
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.file_copy_outlined,
                                        color:
                                            AppColors.primary.withOpacity(.9),
                                        size: 40,
                                      )),
                                  Text(
                                    "ملف",
                                    style: CustomTextStyles.bodyLargeBlack900,
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                  // context.read<ChatCubit>().pickImageFile();
                },
                icon: Icon(
                  Icons.file_upload_outlined,
                  color: AppColors.primary.withOpacity(.9),
                ),
              ),
              suffixIcon: state is ChatImageLoading || state is FileImageLoading
                  ? null
                  : IconButton(
                      onPressed: () async {
                        _sendMessage(context);
                      },
                      icon: Icon(
                        Icons.send,
                        color: widget.controller.text.isEmpty &&
                                context.read<ChatCubit>().file == null &&
                                context.read<ChatCubit>().imageFile == null
                            ? AppColors.gray200
                            : AppColors.primary.withOpacity(.9),
                      ),
                    ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(.9),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(.4),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _sendMessage(BuildContext context) {
    if (context.read<ChatCubit>().imageFile != null ||
        context.read<ChatCubit>().file != null) {
      context.read<ChatCubit>().addNewMessage(widget.controller.text);
      widget.controller.clear();
      widget._controller.animateTo(0,
          duration: const Duration(milliseconds: 120), curve: Curves.easeIn);
      widget.controller.clear();
    } else {
      if (widget.controller.text.isNotEmpty) {
        context.read<ChatCubit>().addNewMessage(widget.controller.text);
        widget.controller.clear();
        widget._controller.animateTo(0,
            duration: const Duration(milliseconds: 120), curve: Curves.easeIn);
        widget.controller.clear();
      }
    }
  }
}
