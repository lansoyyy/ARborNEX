import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String reviewDate;
  final String reviewText;
  final double rating;
  final String avatarUrl;

  const ReviewCard({
    super.key,
    required this.name,
    required this.reviewDate,
    required this.reviewText,
    required this.rating,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatarUrl),
              ),
              const SizedBox(width: 16.0),
              // Name, Rating, and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: Colors.green,
                              size: 14.0,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      reviewDate,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          // Review Text
          Text(
            reviewText,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 24.0,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: const [
          ReviewCard(
            name: "Peds Palakulista",
            reviewDate: "2023-09-08",
            reviewText:
                "The Garden Decor Items Are Beautiful And Add A Nice Touch To My Garden.",
            rating: 4.5,
            avatarUrl:
                "https://via.placeholder.com/150", // Replace with real URL
          ),
          ReviewCard(
            name: "Sophia Jones",
            reviewDate: "2023-09-08",
            reviewText:
                "I Love The Patio Heater. It Keeps Us Warm During Chilly Evenings.",
            rating: 4.5,
            avatarUrl:
                "https://via.placeholder.com/150", // Replace with real URL
          ),
          ReviewCard(
            name: "Princess Albert",
            reviewDate: "2023-09-08",
            reviewText:
                "These Lights Transformed My Garden! They Are Bright And Last All Night.",
            rating: 4.5,
            avatarUrl:
                "https://via.placeholder.com/150", // Replace with real URL
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ReviewsScreen(),
  ));
}
