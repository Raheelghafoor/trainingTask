import 'package:flutter/material.dart';

import '../Resource/resources.dart';
import 'customText.dart';

class CustomAddVehicles extends StatefulWidget {
  const CustomAddVehicles({super.key});

  @override
  State<CustomAddVehicles> createState() => _CustomAddVehiclesState();
}

class _CustomAddVehiclesState extends State<CustomAddVehicles> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
       appBar: AppBar(
         backgroundColor: Resource.colors.whiteColor,
         automaticallyImplyLeading: false,
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Vehicles',style: TextStyle(fontSize: 24),),
             Text("Add new vehicle",style: TextStyle(fontSize: 18),),
           ],
         ),
       ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ListView(
           children:[
             Stack(
             alignment: Alignment.bottomRight,
             children: [
               Container(
                 height: 139,
                 child: Card(
                   color: Resource.colors.mainColor,
                   elevation: 4.0,
                   child: Row(
                     children: [
                       Container(
                         height: 139,
                         width: 166,
                         // width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(8.0),
                             bottomLeft: Radius.circular(8.0),
                           ),
                           image: DecorationImage(
                             image: AssetImage('assets/images/addcar.png'),
                             fit: BoxFit.cover,
                           ),
                         ),

                   ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("BMW M4 CSL 2023",style: TextStyle(fontSize: appSize.height*0.020,color: Colors.white),),
                             SizedBox(height: appSize.height * 0.01),
                             Text("No trips",style: TextStyle(fontSize: 12,color: Colors.grey),),
                             SizedBox(height: appSize.height * 0.01),
                             Text("DAR 1",style: TextStyle(fontSize:12,color: Colors.grey),),


                           ],
                         ),
                       ),
                     ],

                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Positioned(
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
                       height: appSize.height * 0.045,
                       width: appSize.width * 0.25,
                       alignment: Alignment.center,
                       child: Text('70/day',style: TextStyle(color: Colors.white,fontSize: 16),),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ]
         ),
       ),
       );


  }
}
