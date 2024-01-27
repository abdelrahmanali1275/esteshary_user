import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/features/chat/presentation/manager/chat_cubit.dart';

class SelectedImageWidget extends StatelessWidget {
  const SelectedImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatImageLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.maxFinite,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.file(
                context.read<ChatCubit>().imageFile!,
                fit: BoxFit.fill,
              ),
            ),
            IconButton(
                onPressed: () {
                  context.read<ChatCubit>().removeImage();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ))
          ],
        );
      },
    );
  }
}
