import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatServices {

  Future<void> sendMessage(dynamic conversationId,dynamic senderId,dynamic message) async {
    final url = Uri.parse('https://obaidullah1122.pythonanywhere.com/chat/send_message/');

    final headers = {"Content-Type": "application/json"};

    final body = jsonEncode({
      "conversation_id": conversationId,
      "sender_id": senderId,
      "text": message
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Message sent successfully!');
        print('Response: ${response.body}');
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }



  Future<void> getConversations(dynamic userId) async {
    final url = Uri.parse('https://obaidullah1122.pythonanywhere.com/chat/list_conversations/$userId/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> conversations = jsonDecode(response.body);
        print('Conversations: $conversations');

        // Example: Accessing the first conversation
        if (conversations.isNotEmpty) {
          final firstConversation = conversations[0];
          print('First Conversation ID: ${firstConversation['id']}');
        }
      } else {
        print('Failed to fetch conversations. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  Future<void> getMessages(dynamic roomId, dynamic userId) async {
    final url = Uri.parse('https://expresscarr.pythonanywhere.com/$roomId/messages/$userId/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        print('Success: ${jsonResponse['success']}');
        print('Message: ${jsonResponse['message']}');

        final List<dynamic> messages = jsonResponse['data'];
        print('Messages: $messages');

        // Example: Accessing the first message
        if (messages.isNotEmpty) {
          final firstMessage = messages[0];
          print('First Message Text: ${firstMessage['text']}');
        }
      } else {
        print('Failed to fetch messages. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

}