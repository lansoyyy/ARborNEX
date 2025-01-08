import 'package:flutter/material.dart';
import 'package:landscape/screens/favorites_screen.dart';
import 'package:landscape/screens/setting_screen.dart';

class IndoorGardenScreen extends StatelessWidget {
  const IndoorGardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indoor Garden"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/profiless.png'), // Replace with actual profile image path
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Joel Manalo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "0393*******",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoritesScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SettingsScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                CartItemCard(
                  name: 'Grey Star Calathea',
                  category: 'Indoor plants',
                  image:
                      'assets/images/plant1.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Monstera Plants',
                  category: 'Indoor plants',
                  image:
                      'assets/images/plant2.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Chinese Money Plant',
                  category: 'Indoor plants',
                  image:
                      'assets/images/cmp.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Ponytail Palm',
                  category: 'Indoor plants',
                  image:
                      'assets/images/ppg.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Player Plant',
                  category: 'Indoor plants',
                  image:
                      'assets/images/ppgg.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Kentia Palm',
                  category: 'Indoor plants',
                  image:
                      'assets/images/kpg.png', // Replace with actual image path
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String category;
  final String image;

  const CartItemCard({
    super.key,
    required this.name,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(category, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
