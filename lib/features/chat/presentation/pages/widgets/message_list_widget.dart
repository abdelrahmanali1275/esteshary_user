import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../manager/model/messag_model.dart';
import 'message_item_widget.dart';

class MessageListWidget extends StatefulWidget {
  const MessageListWidget({
    super.key,
    required ScrollController controller,
    required this.messagesList,
  }) : _controller = controller;

  final ScrollController _controller;
  final List<Message> messagesList;

  @override
  State<MessageListWidget> createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  List<Message> m = [];

  List<Message> getFirstMessages(List<Message> messages) {
    Map<String, List<Message>> groupedMessages = groupMessagesByDate(messages);

    List<Message> firstMessages = [];

    groupedMessages.forEach((messageDate, messages) {
      messages
          .sort((a, b) => a.createAt.toDate().compareTo(b.createAt.toDate()));

      if (messages.isNotEmpty) {
        firstMessages.add(messages.first);
      }
    });

    return firstMessages;
  }

  Map<String, List<Message>> groupMessagesByDate(List<Message> messages) {
    Map<String, List<Message>> groupedMessages = {};

    for (Message message in messages) {
      final messageDate =
          DateFormat('d/MM/y').format(message.createAt.toDate());

      if (groupedMessages.containsKey(messageDate)) {
        groupedMessages[messageDate]?.add(message);
      } else {
        groupedMessages[messageDate] = [message];
      }
    }

    return groupedMessages;
  }

  bool isDateToday(DateTime dateToCheck) {
    DateTime now = DateTime.now();
    return dateToCheck.year == now.year &&
        dateToCheck.month == now.month &&
        dateToCheck.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    List<Message> firstMessages = getFirstMessages(widget.messagesList);

    return Expanded(
      child: ListView.builder(
          reverse: true,
          controller: widget._controller,
          itemCount: widget.messagesList.length,
          itemBuilder: (context, index) {
            var d = isDateToday(widget.messagesList[index].createAt.toDate())
                ? "اليوم"
                : DateFormat('EEEE at d/MM/y')
                    .format(widget.messagesList[index].createAt.toDate());
            return Column(
              children: [
                if (firstMessages.contains(widget.messagesList[index]))
                  Center(
                    child: Chip(
                      side: BorderSide.none,
                      label: Text(
                        d,
                      ),
                    ),
                  ),
                MessageItemWidget(
                  message: widget.messagesList[index],
                  index: index,
                ),
              ],
            );
          }),
    );
  }
}
