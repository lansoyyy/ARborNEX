import 'package:flutter/material.dart';

class IndoorGardenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indoor Garden"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profiless.png'), // Replace with actual profile image path
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Joel Manalo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "0393*******",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                CartItemCard(
                  name: 'Grey Star Calathea',
                  category: 'Indoor plants',
                  price: 19.99,
                  image: 'assets/images/plant1.png', // Replace with actual image path
                ),
                CartItemCard(
                  name: 'Monstera plants',
                  category: 'Indoor plants',
                  price: 19.99,
                  image: 'assets/images/plant2.png', // Replace with actual image path
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add navigation or functionality for checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue to checkout",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
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
  final double price;
  final String image;

  CartItemCard({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(category, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("\$${price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, size: 16),
                      onPressed: () {
                        // Decrease quantity logic
                      },
                    ),
                    Text(
                      "1", // Replace with dynamic quantity
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, size: 16),
                      onPressed: () {
                        // Increase quantity logic
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
