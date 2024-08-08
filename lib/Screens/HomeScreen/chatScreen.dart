import 'package:flutter/material.dart';

import '../../CustomWidgets/customSearch.dart';
import '../../CustomWidgets/customText.dart';
import '../../Resource/resources.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _chatData = [
    {'name': 'Catherine Powell', 'message': 'Hello!', 'time': '12:30 AM', 'image': Resource.images.circle1},
    {'name': 'Tina Rogers', 'message': 'Great job!!', 'time': '12:30 AM', 'image': Resource.images.circle2},
    {'name': 'Annie Robinson', 'message': 'Thank you! ✨!', 'time': '12:32 AM', 'image': Resource.images.circle3},
    {'name': 'Sam Shaw', 'message': 'As you wish.', 'time': '12:35 AM', 'image': Resource.images.circle4},
    {'name': 'Mack Ingram', 'message': 'When you want to pickup?', 'time': '12:40 AM', 'image': Resource.images.circle1},
    {'name': 'Norma Davis', 'message': 'Can you check?', 'time': '12:45 AM', 'image': Resource.images.circle6},
    {'name': 'ali Davis', 'message': 'Can you check?', 'time': '12:46 AM', 'image': Resource.images.circle6},
    {'name': 'ali Davis', 'message': 'Can you check?', 'time': '12:46 AM', 'image': Resource.images.circle6},
    {'name': 'ali Davis', 'message': 'Can you check?', 'time': '12:46 AM', 'image': Resource.images.circle6},


  ];
  List<Map<String, String>> _filteredChatData = [];

  @override
  void initState() {
    super.initState();
    _filteredChatData = _chatData;
    _searchController.addListener(_filterChats);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterChats() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredChatData = _chatData.where((chat) {
        return chat['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Resource.colors.whiteColor,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: Resource.texts.chat,
              textColor: Resource.colors.textColor,
              fontSize: appSize.height * 0.030,
              textAlign: TextAlign.start,
              isBold: false,
            ),
            SizedBox(height: appSize.height * 0.010),
            CustomSearchContainer(
              controller: _searchController,
              hintText: "Search...",
              icon: Icons.search,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: _filteredChatData.map((chat) {
            return  ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(chat['image']!),
              ),
              title: Text(chat['name']!),
              subtitle: Text(chat['message']!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(chat['time']!),
                  SizedBox(height: 4),
                  Icon(Icons.done_all, color: Colors.blue, size: 16),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}