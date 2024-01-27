import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/features/chat/presentation/manager/chat_cubit.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/message_list_widget.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/selected_file_image.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/selected_image_widget.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/send_message.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../manager/model/messag_model.dart';

bool inChat = false;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});
  final String userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    inChat = true;
    super.initState();
  }

  @override
  void dispose() {
    inChat = false;

    super.dispose();
  }

  final _controller = ScrollController();

  List<Message> messagesList = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: buildSnapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            messagesList.clear();
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i].data()));
            }
            return BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return Column(
                  children: [
                    MessageListWidget(
                      controller: _controller,
                      messagesList: messagesList,
                    ),
                    if (context.read<ChatCubit>().imageFile != null)
                      const SelectedImageWidget(),
                    if (context.read<ChatCubit>().file != null)
                      const SelectedFileWidget(),
                    SendMessage(
                        controller: controller, controller2: _controller),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
        },
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> buildSnapshots() {
    return FirebaseFirestore.instance
        .collection(AppStrings.collectionUsers)
        .doc(widget.userId)
        .collection(AppStrings.messageCollection)
        .orderBy(AppStrings.createAt, descending: true)
        .snapshots();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leadingWidth: 30,
      //automaticallyImplyLeading: false,
      backgroundColor: AppColors.whiteA700,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.black900,
          )),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              AppAssets.chat,
            ),
            radius: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            AppStrings.support,
            style: TextStyle(color: AppColors.black900),
          ),
        ],
      ),
    );
  }
}
