// import 'package:flutter/cupertino.dart';
// import 'package:traning_task/Resource/resources.dart';
//
// import 'customCard.dart';
//
// class CustomCardList extends StatelessWidget {
//   final Function(Map<String, String>) onFavoriteToggle;
//
//   CustomCardList({required this.onFavoriteToggle});
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> cardList = [
//       {
//         "title": Resource.texts.gmc,
//         "rate":Resource.texts.rate,
//         "trip": Resource.texts.trip,
//         "z6": Resource.texts.z6,
//         "image": Resource.images.car1,
//         "dayText": Resource.texts.$day,
//       },
//       {
//         "title": Resource.texts.bmw,
//         "rate":Resource.texts.rate1,
//         "trip": Resource.texts.trip1,
//         "z6": Resource.texts.z6,
//         "image": Resource.images.car2,
//         "dayText": Resource.texts.$day,
//       },
//     ];
//
//     return Column(
//       children: cardList.map((item) {
//         return CustomCard(
//           title: item['title']!,
//           rate: item['rate']!,
//           trip: item['trip']!,
//           z6: item['z6']!,
//           image: item['image']!,
//           dayText: item['dayText']!,
//           onFavorite: onFavoriteToggle,
//         );
//       }).toList(),
//     );
//   }
// }