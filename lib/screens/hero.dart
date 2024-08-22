import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottomnavbar.dart';
import 'package:flutter_application_2/screens/detailsHero.dart';
import 'package:flutter_application_2/screens/menu.dart';

class Heroo extends StatefulWidget {
  const Heroo({super.key});

  @override
  State<Heroo> createState() => _HerooState();
}

class _HerooState extends State<Heroo> {
  int selectedIndex = -1;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: ,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 45, 0, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on_outlined,
                    size: 45,
                  ),
                ),
                const Flexible(
                  child: ListTile(
                    title: Text(
                      "Your location",
                      style:
                          TextStyle(color: Color.fromARGB(255, 153, 144, 144)),
                    ),
                    subtitle: Text(
                      "Puebla, Mexico",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Menu()));
                    },
                    icon: const Icon(
                      Icons.menu_open_sharp,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: "Where you want to go...",
                filled: true,
                fillColor: const Color.fromARGB(255, 213, 210, 210),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // this yaha phenkna ha
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(buttonLabels.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (selectedIndex == index) {
                              return Colors.amber;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        buttonLabels[index],
                        style: TextStyle(
                          fontSize: 15,
                          color: selectedIndex == index
                              ? Colors.white
                              : const Color.fromARGB(255, 102, 98, 98),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Available near you',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: const CustomCard(
              imagePath: 'assets/images/car1.png',
              title: 'GMC Terrain 2021',
              rating: '5.0    (10 trips)',
              location: 'Zocalo de Puebla - 8.2 mi',
              pricePerDay: '40 /day',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: const CustomCard(
              imagePath: 'assets/images/car2.png',
              title: 'GMC Terrain 2021',
              rating: '5.0    (10 trips)',
              location: 'Zocalo de Puebla - 8.2 mi',
              pricePerDay: '40 /day',
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

final List<String> buttonLabels = [
  "All",
  "Cars",
  "Trucks",
  "SUVs",
  "Vans",
];

// Your CustomCard widget class goes here
class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String location;
  final String pricePerDay;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.location,
    required this.pricePerDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Detailshero()));
          },
          child: Container(
            width: 390,
            height: 400,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 46, 39, 39),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    rating,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    location,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          right: -5,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 150, 8),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(20),
              ),
              border: Border.all(
                color: Colors.white,
                width: 2.0, // Adjust the width of the border as needed
              ),
            ),
            width: 100,
            height: 70,
            child: Center(
              child: Text(
                pricePerDay,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/components/bottomnavbar.dart';
// import 'package:flutter_application_2/screens/detailsHero.dart';
// import 'package:flutter_application_2/screens/menu.dart';

// class Heroo extends StatefulWidget {
//   const Heroo({super.key});

//   @override
//   State<Heroo> createState() => _HerooState();
// }

// class _HerooState extends State<Heroo> {
//   int selectedIndex = -1;
//   int _selectedIndex = 0;
//   final List<CustomCard> favorites = [];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _addToFavorites(CustomCard card) {
//     setState(() {
//       favorites.add(card);
//     });
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FavoritesPage(favorites: favorites),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 45, 0, 0),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.location_on_outlined,
//                     size: 45,
//                   ),
//                 ),
//                 const Flexible(
//                   child: ListTile(
//                     title: Text(
//                       "Your location",
//                       style:
//                           TextStyle(color: Color.fromARGB(255, 153, 144, 144)),
//                     ),
//                     subtitle: Text(
//                       "Puebla, Mexico",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 15),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Menu()));
//                     },
//                     icon: const Icon(
//                       Icons.menu_open_sharp,
//                       size: 40,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 floatingLabelBehavior: FloatingLabelBehavior.never,
//                 prefixIcon: const Icon(Icons.search_rounded),
//                 hintText: "Where you want to go...",
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 213, 210, 210),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Padding(
//             padding: EdgeInsets.only(left: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   'Categories',
//                   style: TextStyle(
//                     fontSize: 25,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(buttonLabels.length, (index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: TextButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                             if (selectedIndex == index) {
//                               return Colors.amber;
//                             }
//                             return Colors.transparent;
//                           },
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Text(
//                         buttonLabels[index],
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: selectedIndex == index
//                               ? Colors.white
//                               : const Color.fromARGB(255, 102, 98, 98),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   'Available near you',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           CustomCard(
//             imagePath: 'assets/images/car1.png',
//             title: 'GMC Terrain 2021',
//             rating: '5.0    (10 trips)',
//             location: 'Zocalo de Puebla - 8.2 mi',
//             pricePerDay: '40 /day',
//             onFavoritePressed: () {
//               _addToFavorites(CustomCard(
//                 imagePath: 'assets/images/car1.png',
//                 title: 'GMC Terrain 2021',
//                 rating: '5.0    (10 trips)',
//                 location: 'Zocalo de Puebla - 8.2 mi',
//                 pricePerDay: '40 /day',
//                 onFavoritePressed: () {}, // Providing an empty callback
//               ));
//             },
//           ),
//           const SizedBox(height: 20),
//           CustomCard(
//             imagePath: 'assets/images/car2.png',
//             title: 'GMC Terrain 2021',
//             rating: '5.0    (10 trips)',
//             location: 'Zocalo de Puebla - 8.2 mi',
//             pricePerDay: '40 /day',
//             onFavoritePressed: () {
//               _addToFavorites(CustomCard(
//                 imagePath: 'assets/images/car2.png',
//                 title: 'GMC Terrain 2021',
//                 rating: '5.0    (10 trips)',
//                 location: 'Zocalo de Puebla - 8.2 mi',
//                 pricePerDay: '40 /day',
//                 onFavoritePressed: () {}, // Providing an empty callback
//               ));
//             },
//           ),
//         ]),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// final List<String> buttonLabels = [
//   "All",
//   "Cars",
//   "Trucks",
//   "SUVs",
//   "Vans",
// ];

// class CustomCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String rating;
//   final String location;
//   final String pricePerDay;
//   final VoidCallback onFavoritePressed;

//   const CustomCard({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this.rating,
//     required this.location,
//     required this.pricePerDay,
//     required this.onFavoritePressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Detailshero()));
//           },
//           child: Container(
//             width: 390,
//             height: 400,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               color: Color.fromARGB(255, 46, 39, 39),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(imagePath),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 10),
//                       child: Text(
//                         title,
//                         style:
//                             const TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: onFavoritePressed,
//                       icon: const Icon(
//                         Icons.favorite_outline,
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Text(
//                     rating,
//                     style: const TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, top: 10),
//                   child: Text(
//                     location,
//                     style: const TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: -5,
//           right: -5,
//           child: Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 239, 150, 8),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(30),
//                 topLeft: Radius.circular(20),
//               ),
//               border: Border.all(
//                 color: Colors.white,
//                 width: 2.0,
//               ),
//             ),
//             width: 100,
//             height: 70,
//             child: Center(
//               child: Text(
//                 pricePerDay,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FavoritesPage extends StatelessWidget {
//   final List<CustomCard> favorites;

//   const FavoritesPage({Key? key, required this.favorites}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorites'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//         child: ListView.builder(
//           itemCount: favorites.length,
//           itemBuilder: (context, index) {
//             return favorites[index];
//           },
//         ),
//       ),
//     );
//   }
// }
