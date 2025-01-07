// import 'package:flutter/material.dart';

// class LandscaperDetailsScreen extends StatelessWidget {
//   final String landscaperName;

//   const LandscaperDetailsScreen({Key? key, required this.landscaperName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(landscaperName),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/placeholder.jpg', // Replace with landscaper image
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 'Why Hire Me?',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'I bring a unique blend of horticulture expertise, creativity, and dedication to every project.',
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 'Contact Info',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text('Phone: 123-456-7890\nEmail: example@gmail.com'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
