// import 'package:flutter/material.dart';
// import 'category_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ARborNEX'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Plants, Products',
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//             ),

//             // Banner
//             Container(
//               margin: const EdgeInsets.all(16.0),
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 image: const DecorationImage(
//                   image: AssetImage('assets/banner.jpg'), // Replace with your image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16.0),
//                   gradient: LinearGradient(
//                     colors: [Colors.black54, Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 child: const Text(
//                   'HIRE A LANDSCAPER EXPERT',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),

//             // Categories Grid
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                   childAspectRatio: 3 / 2,
//                 ),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   final categories = [
//                     'Outdoor Landscaping',
//                     'Balcony Landscaping',
//                     'Traditional Landscaping',
//                     'Indoor Landscaping',
//                   ];
//                   final images = [
//                     'assets/outdoor.jpg',
//                     'assets/balcony.jpg',
//                     'assets/traditional.jpg',
//                     'assets/indoor.jpg',
//                   ];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CategoryScreen(
//                             category: categories[index],
//                           ),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       clipBehavior: Clip.antiAlias,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           Image.asset(
//                             images[index],
//                             fit: BoxFit.cover,
//                           ),
//                           Container(
//                             color: Colors.black54,
//                             child: Center(
//                               child: Text(
//                                 categories[index],
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'My Projects',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Colors.green,
//       ),
//     );
//   }
// }
