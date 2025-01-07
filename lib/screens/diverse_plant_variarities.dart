import 'package:flutter/material.dart';

class InfoPlant extends StatefulWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;
  final List<String> plantCareInstructions;

  InfoPlant({
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
              Card(
                elevation: 5,
                child: Row(
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
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right side with plant details (outside the card with smaller gap)
                    SizedBox(width: 8), // Smaller gap between image and text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Plant name and Indoor label (smaller font)
                            Text(
                              '${widget.plantName} (Indoor)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold), // Reduced font size
                            ),
                            SizedBox(height: 3), // Reduced gap
                            // Green star rating and percentage (smaller icons)
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 18, // Smaller icon size
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text('95%',
                                    style: TextStyle(
                                        fontSize: 14)), // Smaller text size
                              ],
                            ),
                            SizedBox(height: 5), // Reduced gap
                            // Green line
                            Divider(color: Colors.green),
                            SizedBox(height: 5),
                            // Type and Indoor Plant label
                            Text('Type: Indoor Plant',
                                style: TextStyle(fontSize: 14)), // Smaller text
                            SizedBox(height: 5), // Reduced gap
                            // Green line
                            Divider(color: Colors.green),
                            SizedBox(height: 5),
                            // Size and dropdown
                            Text('Size:', style: TextStyle(fontSize: 14)),
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
                                      style: TextStyle(
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
                              hint: Text('Select size',
                                  style: TextStyle(
                                      fontSize: 14)), // Smaller hint text
                            ),
                            SizedBox(height: 5), // Reduced gap
                            // Green line
                            Divider(color: Colors.green),
                            SizedBox(height: 5),
                            // Quantity with toggle
                            Text('Quantity:', style: TextStyle(fontSize: 14)),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove, color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) quantity--;
                                    });
                                  },
                                ),
                                Text('$quantity',
                                    style: TextStyle(
                                        fontSize: 14)), // Display the quantity
                                IconButton(
                                  icon: Icon(Icons.add, color: Colors.green),
                                  onPressed: () {
                                    setState(() {
                                      if (quantity < 5)
                                        quantity++; // Limit to 5
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 5), // Reduced gap
                            // Green line
                            Divider(color: Colors.green),
                            SizedBox(height: 5),
                            // Color options
                            Text('Color:', style: TextStyle(fontSize: 14)),
                            Row(
                              children: [
                                Card(
                                  color: Colors.red,
                                  child: SizedBox(width: 30, height: 30),
                                ),
                                Card(
                                  color: Colors.blue,
                                  child: SizedBox(width: 30, height: 30),
                                ),
                                Card(
                                  color: Colors.green,
                                  child: SizedBox(width: 30, height: 30),
                                ),
                              ],
                            ),
                            SizedBox(height: 15), // Reduced gap
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Additional small image cards aligned to the left with small space between them
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  Card(
                    elevation: 3,
                    child: Image.asset(
                      widget.plantImage, // Use dynamic plant image
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 8), // Add small space between the cards
                  Card(
                    elevation: 3,
                    child: Image.asset(
                      'assets/images/cactus.png', // Replace with appropriate image
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 8), // Add small space between the cards
                  Card(
                    elevation: 3,
                    child: Image.asset(
                      'assets/images/orchid.png', // Replace with appropriate image
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Plant name, description, subtitle, and bullet points
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.green[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plantName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(widget.plantDescription),
                    SizedBox(height: 8),
                    Text(
                      'Plant Care Instructions:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    // Loop through care instructions
                    for (var instruction in widget.plantCareInstructions)
                      BulletText(text: instruction),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Reviews section
              Row(
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
              SizedBox(height: 20),
              // Review card with image and description
              Card(
                elevation: 5,
                child: Row(
                  children: [
                    Image.asset(
                      widget.plantImage, // Use dynamic plant image
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'This plant has been amazing! It adds a nice touch to my living room.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  BulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 8, color: Colors.green),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}
