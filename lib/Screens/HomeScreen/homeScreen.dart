import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_task/Screens/HomeScreen/tripScreen.dart';
import '../../CustomWidgets/customCard.dart';
import '../../CustomWidgets/customNavigation.dart';
import '../../CustomWidgets/customSearch.dart';
import '../../Resource/resources.dart';
import 'Drawer/drawer.dart';
import 'carBookingScreen.dart';
import 'chatScreen.dart';
import 'favoriteScreen.dart';
import 'hostScreen.dart';
import '../../CustomWidgets/customText.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int _currentIndex = 0;
  List<Map<String, String>> favoriteItems = [];

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreenContent(onFavoriteToggle: _toggleFavorite),
      HostScreen(),
      ChatScreen(),
      TripScreen(),
      FavoritScreen(favoriteItems: favoriteItems),
    ]);
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleFavorite(Map<String, String> item) {
    setState(() {
      final existingIndex = favoriteItems.indexWhere((element) => element['title'] == item['title']);
      if (existingIndex >= 0 ) {
        favoriteItems.removeAt(existingIndex);
      } else {
        favoriteItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: _screens[_currentIndex],
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  final Function(Map<String, String>) onFavoriteToggle;

  HomeScreenContent({required this.onFavoriteToggle});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  List<Map<String, String>> carList = [
    {"heading": "All"},
    {"heading": "Cars"},
    {"heading": "CUvs"},
    {"heading": "Trucks"},
    {"heading": "Vans"},
  ];

  List<Map<String, String>> cardList = [
    {
      "title": Resource.texts.gmc,
      "rate": Resource.texts.rate,
      "trip": Resource.texts.trip,
      "z6": Resource.texts.z6,
      "image": Resource.images.car1,
      "dayText": Resource.texts.$day,
    },
    {
      "title": Resource.texts.bmw,
      "rate": Resource.texts.rate1,
      "trip": Resource.texts.trip1,
      "z6": Resource.texts.z6,
      "image": Resource.images.car2,
      "dayText": Resource.texts.$day,
    },
  ];

  List<Map<String, String>> filteredCardList = [];
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCardList = cardList; // Initially show all cards

    searchController.addListener(() {
      _filterCards(searchController.text);
    });
  }

  void _filterCards(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCardList = cardList;
      } else {
        filteredCardList = cardList
            .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
      appBar: AppBar(
        backgroundColor: Resource.colors.whiteColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(Resource.images.place,),
              SizedBox(width: appSize.width * 0.040),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: Resource.texts.locat,
                    textColor: Resource.colors.gColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  CustomText(
                    title: Resource.texts.puebla,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.025,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomDrawer(),
                    ),
                  );
                },
                child: SvgPicture.asset(Resource.images.drawer, height: 23,),
              ),
            ],
          )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomSearchContainer(
              controller: searchController,
              hintText: "Where you want to go...",
              icon: Icons.search,
            ),
            SizedBox(height: appSize.height * 0.030),
            Row(
              children: [
                CustomText(
                  title: Resource.texts.categories,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.025,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
              ],
            ),
            SizedBox(height: appSize.height * 0.030),
            Container(
              height: appSize.height * 0.060,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 90,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Resource.colors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        carList[index]["heading"]!,
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Resource.colors.gColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: appSize.height * 0.030),
            Row(
              children: [
                CustomText(
                  title: Resource.texts.available,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.025,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
              ],
            ),
            Column(
              children: filteredCardList.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarBookingScreen()),
                    );
                  },
                  child: CustomCard(
                    title: item['title']!,
                    rate: item['rate']!,
                    trip: item['trip']!,
                    z6: item['z6']!,
                    image: item['image']!,
                    dayText: item['dayText']!,
                    onFavorite: widget.onFavoriteToggle,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}