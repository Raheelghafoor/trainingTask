import 'package:chatview/chatview.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomChatView extends StatefulWidget {
  const CustomChatView({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  _CustomChatViewState createState() => _CustomChatViewState();
}

class _CustomChatViewState extends State<CustomChatView> {
  late final ChatController chatController;
  late Map<String, dynamic> displayData;
  final String apiUrl = 'https://expresscarr.pythonanywhere.com/chat';
  int conversationId = 5; // Update this as needed

  @override
  void initState() {
    super.initState();
    displayData = widget.data.isNotEmpty ? widget.data : {};

    chatController = ChatController(
      initialMessageList: [],
      scrollController: ScrollController(),
      chatUsers: [
        ChatUser(
          id: '1',
          name: displayData['name'] ?? 'Unknown',
          profilePhoto: displayData['profilePhoto'] ?? '',
        ),
        ChatUser(
          id: '2',
          name: "Amjad Ali",
          profilePhoto: 'https://fastly.picsum.photos/id/318/200/300.jpg?hmac=WEC_ft7NGxXgRDHWhj1tz7_gmAOrnI9d5IiS98juw8I',
        ),
      ],
    );

    _initiateChat();
  }

  Future<void> _initiateChat() async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/start_conversation/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "initiator_id": 110,
          "receiver_id": 90,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        List<Message> messages = _parseMessages(jsonResponse['message_set']);
        setState(() {
          chatController.addMessage(messages as Message);
        });
        conversationId = jsonResponse['conversation_id'];
      } else {
        throw Exception('Failed to initiate chat');
      }
    } catch (e) {
      print('Error initiating chat: $e');
    }
  }

  List<Message> _parseMessages(List<dynamic> messageSet) {
    return messageSet.map((message) {
      return Message(
        id: message['id'].toString(),
        message: message['message_text'],
        createdAt: DateTime.parse(message['created_at']),
        sendBy: message['sender_id'].toString(),
        messageType: MessageType.text,
      );
    }).toList();
  }

  void _sendMessage(String messageText) async {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: messageText,
      createdAt: DateTime.now(),
      sendBy: '1',
      messageType: MessageType.text,
    );

    setState(() {
      chatController.addMessage(newMessage);
    });

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/send_message/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "conversation_id": conversationId,
          "sender_id": 110,
          "text": messageText,
        }),
      );

      if (response.statusCode == 200) {
        print(' sending message==========================${response.statusCode}----${conversationId}');

      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatView(
        chatController: chatController,
        currentUser: ChatUser(
          id: '1',
          name: displayData['name'] ?? 'Unknown',
          profilePhoto: displayData['profilePhoto'] ?? '',
        ),
        onSendTap: (message, replyMessage, messageType) {
          if (message.isNotEmpty) {
            _sendMessage(message);
          }
        },
        chatViewState: chatController.initialMessageList.isNotEmpty
            ? ChatViewState.hasMessages
            : ChatViewState.noData,
      ),
    );
  }
}