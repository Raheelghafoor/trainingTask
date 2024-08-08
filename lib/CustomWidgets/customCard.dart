import 'package:flutter/material.dart';

import '../Resource/resources.dart';
import 'customText.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String rate;
  final String trip;
  final String z6;
  final String image;
  final String dayText;
  final Function(Map<String, String>)? onFavorite;

  CustomCard({
    required this.title,
    required this.rate,
    required this.trip,
    required this.z6,
    required this.image,
    required this.dayText,
    this.onFavorite,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (widget.onFavorite != null) {
      widget.onFavorite!({
        'title': widget.title,
        'rate': widget.rate,
        'trip': widget.trip,
        'z6': widget.z6,
        'image': widget.image,
        'dayText': widget.dayText,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          child: Card(
            color: Resource.colors.mainColor,
            elevation: 4.0,
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: widget.title,
                                  textColor: Resource.colors.whiteColor,
                                  fontSize: appSize.height * 0.020,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: widget.rate,
                                      textColor: Resource.colors.gColor,
                                      fontSize: appSize.height * 0.020,
                                      textAlign: TextAlign.start,
                                      isBold: false,
                                    ),
                                    Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                                    CustomText(
                                      title: widget.trip,
                                      textColor: Resource.colors.gColor,
                                      fontSize: appSize.height * 0.020,
                                      textAlign: TextAlign.start,
                                      isBold: false,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  title: widget.z6,
                                  textColor: Resource.colors.gColor,
                                  fontSize: appSize.height * 0.020,
                                  textAlign: TextAlign.start,
                                  isBold: false,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 40),
                            child: GestureDetector(
                              onTap: _toggleFavorite,
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                                color: isFavorite ? Colors.red : Resource.colors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Resource.colors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(color: Resource.colors.whiteColor),
              ),
              height: appSize.height * 0.050,
              width: appSize.width * 0.25,
              alignment: Alignment.center,
              child: CustomText(
                title: widget.dayText,
                textColor: Resource.colors.whiteColor,
                fontSize: appSize.height * 0.025,
                textAlign: TextAlign.center,
                isBold: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}