class ChatModel {
  final bool isMe;
  final String messageContent;
  ChatModel({
    required this.isMe,
    required this.messageContent,
  });
}

List<ChatModel> listOfChats = [
  ChatModel(
    isMe: false,
    messageContent: 'Alright will be expecting you',
  ),
  ChatModel(
    isMe: true,
    messageContent: 'Yeah sure!!!',
  ),
  ChatModel(
    isMe: false,
    messageContent:
        'Hello Good morning. Please will you be ready by 10 am today for your pickup',
  ),
  ChatModel(
    isMe: true,
    messageContent: 'Hello',
  ),
];
