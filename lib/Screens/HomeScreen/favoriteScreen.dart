import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/customCard.dart';
import '../../CustomWidgets/customText.dart';
import '../../Resource/resources.dart';

class FavoritScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteItems;

  const FavoritScreen({
    Key? key,
    this.favoriteItems = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,left: 12,right: 12,bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: Resource.texts.fav,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.024,
                textAlign: TextAlign.start,
                isBold: true,
              ),
              Column(
                children: favoriteItems.map((item) {
                  return CustomCard(
                    title: item['title'] ?? "",
                    rate: item['rate'] ?? "",
                    trip: item['trip'] ?? "",
                    z6: item['z6'] ?? "",
                    image: item['image'] ?? "",
                    dayText: item['dayText'] ?? "",
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}