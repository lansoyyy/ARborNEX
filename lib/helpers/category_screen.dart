// import 'package:flutter/material.dart';
// import 'landscaper_details_screen.dart';

// class CategoryScreen extends StatelessWidget {
//   final String category;

//   const CategoryScreen({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final landscapers = [
//       'Harrison Grove',
//       'Emma Green',
//       'John Meadows',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category),
//         backgroundColor: Colors.green,
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//         ),
//         itemCount: landscapers.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LandscaperDetailsScreen(
//                     landscaperName: landscapers[index],
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 5,
//               child: Center(
//                 child: Text(
//                   landscapers[index],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
