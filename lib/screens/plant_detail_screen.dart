import 'package:flutter/material.dart';
import 'package:landscape/helpers/review_card.dart';

class PlantDetailScreen extends StatefulWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;
  final List<String> plantCareInstructions;

  const PlantDetailScreen({
    super.key,
    required this.plantName,
    required this.plantImage,
    required this.plantDescription,
    required this.plantCareInstructions,
  });
  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  String? selectedSize = '3 inch'; // Default selected size

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade900),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.green.shade900),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade900),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border,
                                color: Colors.green.shade900),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade900),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.upload_outlined,
                                color: Colors.green.shade900),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    widget.plantImage,
                    height: 280,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.plantName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'Size: 2ft / 3ft',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.star_half_outlined,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.8 Rating',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Create a TextPainter to measure the height of the text
                          final textSpan = TextSpan(
                            text: widget.plantDescription,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          );

                          final textPainter = TextPainter(
                            text: textSpan,
                            maxLines: 2,
                            textDirection: TextDirection.ltr,
                          )..layout(maxWidth: constraints.maxWidth);

                          final isOverflowing = textPainter.didExceedMaxLines;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isExpanded
                                  ? Text(
                                      widget.plantDescription,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    )
                                  : Text(
                                      widget.plantDescription,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              if (isOverflowing)
                                GestureDetector(
                                  onTap: () {
                                    showDetails();
                                  },
                                  child: Text(
                                    isExpanded ? 'Read Less' : 'Read More',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/new/Group 76055.png',
                        height: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.grey),

                      // Size and dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Size:', style: TextStyle(fontSize: 16)),
                          DropdownButton<String>(
                            value: selectedSize, // Display the selected value
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
                                        fontSize: 14)), // Smaller dropdown text
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedSize = newValue; // Update selected size
                              });
                            },
                            hint: const Text('Select size',
                                style: TextStyle(
                                    fontSize: 16)), // Smaller hint text
                          ),
                        ],
                      ),

                      // Green line
                      const Divider(color: Colors.grey),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green.shade900,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Add to Design',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showDetails();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 125,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDetails() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.plantName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Size: 2ft / 3ft',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.8 Rating',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.plantDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReviewCard(
                    name: "Peds Palakulista",
                    reviewDate: "2023-09-08",
                    reviewText:
                        "The Garden Decor Items Are Beautiful And Add A Nice Touch To My Garden.",
                    rating: 4.5,
                    avatarUrl:
                        'assets/images/new/Ellipse 7.png', // Replace with real URL
                  ),
                  const ReviewCard(
                    name: "Sophia Jones",
                    reviewDate: "2023-09-08",
                    reviewText:
                        "I Love The Patio Heater. It Keeps Us Warm During Chilly Evenings.",
                    rating: 4.5,
                    avatarUrl:
                        'assets/images/new/Ellipse 7 (1).png', // Replace with real URL
                  ),
                  const ReviewCard(
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
            ),
          ),
        );
      },
    );
  }
}
