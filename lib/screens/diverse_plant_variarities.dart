import 'package:flutter/material.dart';
import 'package:landscape/helpers/plant_data.dart';
import 'package:landscape/helpers/review_card.dart';

class InfoPlant extends StatefulWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;
  final List<String> plantCareInstructions;

  const InfoPlant({
    super.key,
    required this.plantName,
    required this.plantImage,
    required this.plantDescription,
    required this.plantCareInstructions,
  });

  @override
  _InfoPlantState createState() => _InfoPlantState();
}

class _InfoPlantState extends State<InfoPlant> {
  String? selectedSize = '3 inch'; // Default selected size
  int quantity = 1; // Initial quantity

  List colors = [
    Colors.white,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plantName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card with image on the upper left and details on the right (smaller text)
              Row(
                children: [
                  // Left side with image placed on the upper part inside the card
                  Card(
                    elevation: 100, // Adjust elevation if needed
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            widget.plantImage, // Use dynamic plant image
                            width: 150,
                            height: 300,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right side with plant details (outside the card with smaller gap)
                  const SizedBox(
                      width: 8), // Smaller gap between image and text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Plant name and Indoor label (smaller font)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.plantName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold), // Reduced font size
                              ),
                              const Text(
                                'Indoor',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.bold), // Reduced font size
                              ),
                            ],
                          ),
                          const SizedBox(height: 3), // Reduced gap
                          // Green star rating and percentage (smaller icons)
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 14, // Smaller icon size
                                ),

                              const SizedBox(width: 5),
                              Text('(158)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .green[900])), // Smaller text size
                            ],
                          ),
                          const SizedBox(height: 5), // Reduced gap
                          // Green line
                          const Divider(color: Colors.green),
                          const SizedBox(height: 5),
                          // Type and Indoor Plant label
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Type:', style: TextStyle(fontSize: 14)),
                              Text('Indoor Plant',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ), // Smaller text
                          const SizedBox(height: 5), // Reduced gap
                          // Green line
                          const Divider(color: Colors.green),

                          // Size and dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Size:',
                                  style: TextStyle(fontSize: 14)),
                              DropdownButton<String>(
                                value:
                                    selectedSize, // Display the selected value
                                items: <String>[
                                  '3 inch',
                                  '4 inch',
                                  '5 inch',
                                  '6 inch'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: const TextStyle(
                                            fontSize:
                                                14)), // Smaller dropdown text
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSize =
                                        newValue; // Update selected size
                                  });
                                },
                                hint: const Text('Select size',
                                    style: TextStyle(
                                        fontSize: 14)), // Smaller hint text
                              ),
                            ],
                          ),

                          // Green line
                          const Divider(color: Colors.green),

                          // Quantity with toggle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Quantity:',
                                  style: TextStyle(fontSize: 14)),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text('$quantity',
                                      style: const TextStyle(
                                          fontSize:
                                              14)), // Display the quantity
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity < 5)
                                          quantity++; // Limit to 5
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Green line
                          const Divider(color: Colors.green),
                          const SizedBox(height: 5),
                          // Color options
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Color:',
                                  style: TextStyle(fontSize: 14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  for (int i = 0; i < colors.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            color: colors[i],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const SizedBox(
                                            width: 17.5, height: 17.5),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 15), // Reduced gap
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Additional small image cards aligned to the left with small space between them
              Row(
                children: [
                  SizedBox(
                    width: 175,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Align to the left
                        children: [
                          for (int i = 0;
                              i <
                                  plants.where(
                                    (element) {
                                      return element.name != widget.plantName;
                                    },
                                  ).length;
                              i++)
                            Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/new/${plants[i].name}.png', // Use dynamic plant image
                                width: 100,
                                height: 100,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green.shade900,
                          minimumSize: const Size(175, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 175,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade900),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Wishlist',
                            style: TextStyle(color: Colors.green.shade900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Plant name, description, subtitle, and bullet points
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plantName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.plantDescription),
                    const SizedBox(height: 8),
                    const Text(
                      'Plant Care Instructions:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // Loop through care instructions
                    for (var instruction in widget.plantCareInstructions)
                      BulletText(text: instruction),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Reviews section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}
