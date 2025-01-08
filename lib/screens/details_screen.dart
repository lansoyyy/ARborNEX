import 'package:flutter/material.dart';
import 'package:landscape/helpers/review_card.dart';

class DetailsScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String number;
  final String email;
  final String projectDescription;
  final String additionalInfo;
  final String likes;
  final String type;

  const DetailsScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.number,
      required this.email,
      required this.projectDescription,
      required this.additionalInfo,
      required this.likes,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/new/Group 76175 (1).png',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          imagePath,
                          height: 300,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, I'm\n$title",
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold), // Reduced font size
                        ),
                        Text(
                          type,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.normal), // Reduced font size
                        ),
                        const SizedBox(
                          height: 180,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.phone_android,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              number,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.normal), // Reduced font size
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.normal), // Reduced font size
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Why hire me?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900]), // Reduced font size
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I’m committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black), // Reduced font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Reviews section
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Review card with image and description
                SizedBox(
                  height: 500,
                  child: ListView(
                    children: const [
                      ReviewCard(
                        name: "Peds Palakulista",
                        reviewDate: "2023-09-08",
                        reviewText:
                            "The Garden Decor Items Are Beautiful And Add A Nice Touch To My Garden.",
                        rating: 4.5,
                        avatarUrl:
                            'assets/images/new/Ellipse 7.png', // Replace with real URL
                      ),
                      ReviewCard(
                        name: "Sophia Jones",
                        reviewDate: "2023-09-08",
                        reviewText:
                            "I Love The Patio Heater. It Keeps Us Warm During Chilly Evenings.",
                        rating: 4.5,
                        avatarUrl:
                            'assets/images/new/Ellipse 7 (1).png', // Replace with real URL
                      ),
                      ReviewCard(
                        name: "Princess Albert",
                        reviewDate: "2023-09-08",
                        reviewText:
                            "These Lights Transformed My Garden! They Are Bright And Last All Night.",
                        rating: 4.5,
                        avatarUrl:
                            'assets/images/new/Ellipse 7 (2).png', // Replace with real URL
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
