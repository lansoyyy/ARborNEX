// import 'package:flutter/material.dart';
// import '../models/landscaper.dart';
// import 'landscaper_details_screen.dart';

// class LandscaperListScreen extends StatelessWidget {
//   LandscaperListScreen({super.key});

//   final List<Landscaper> landscapers = [
//     Landscaper(
//       name: 'Harrison Grove',
//       profession: 'Landscape Architect',
//       description: 'Specialized in outdoor design and sustainability.',
//       contact: '123-456-7890',
//       email: 'harrison.grove@gmail.com',
//       rating: 5,
//     ),
//     Landscaper(
//       name: 'Emma Green',
//       profession: 'Landscape Designer',
//       description: 'Expert in modern garden design and planting.',
//       contact: '987-654-3210',
//       email: 'emma.green@gmail.com',
//       rating: 4,
//     ),
//     Landscaper(
//       name: 'John Meadows',
//       profession: 'Horticulturist',
//       description: 'Focusing on plant health and garden care.',
//       contact: '456-789-1230',
//       email: 'john.meadows@gmail.com',
//       rating: 5,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Landscapers Near You'),
//         backgroundColor: Colors.green,
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: landscapers.length,
//         itemBuilder: (context, index) {
//           final landscaper = landscapers[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       LandscaperDetailsScreen(landscaper: landscaper),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 5,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Image.asset(
//                       'assets/images/image 1.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       landscaper.name,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Text(landscaper.profession),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
