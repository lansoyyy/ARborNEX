// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   static const String dbName = 'landscaper.db';
//   static const String tableName = 'landscapers';

//   Future<Database> _initializeDB() async {
//     final path = await getDatabasesPath();
//     return openDatabase(
//       join(path, dbName),
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE $tableName (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             name TEXT,
//             profession TEXT,
//             description TEXT,
//             contact TEXT,
//             email TEXT,
//             rating INTEGER
//           )
//         ''');
//       },
//       version: 1,
//     );
//   }

//   Future<void> insertLandscaper(Map<String, dynamic> landscaper) async {
//     final db = await _initializeDB();
//     await db.insert(tableName, landscaper);
//   }

//   Future<List<Map<String, dynamic>>> getLandscapers() async {
//     final db = await _initializeDB();
//     return db.query(tableName);
//   }

//   Future<void> deleteLandscapers() async {
//     final db = await _initializeDB();
//     await db.delete(tableName);
//   }
// }
