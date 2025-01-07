import 'package:flutter/material.dart';

class GardenPlannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            Text(
              'Garden Planner',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.grey),
              onPressed: () {},
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/prof.jpg'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Search Plants, Products...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Carousel Section for Highlighted Garden Plan (Before & After)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 200,
                    child: PageView(
                      children: [
                        // First Garden Plan Image (Before & After)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/before.jpg'), // Before Image
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.3),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Transform Your Garden: Before & After',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Second Garden Plan Image (Before & After)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/after.jpg'), // After Image
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.3),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Create a Beautiful Space: Before & After',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Customize Project Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),

                // Sample Projects Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sample Projects by Architects',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Grid of Sample Projects (Example)
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    GardenOptionCard(
                      title: 'Modern Landscape',
                      imagePath: 'assets/images/modern1.jpg',
                      onTap: () {},
                    ),
                    GardenOptionCard(
                      title: 'Zen Garden',
                      imagePath: 'assets/images/Zen.jpg',
                      onTap: () {},
                    ),
                    GardenOptionCard(
                      title: 'Playground Garden',
                      imagePath: 'assets/images/PlayGround.jpg',
                      onTap: () {},
                    ),
                    GardenOptionCard(
                      title: 'Pool Garden',
                      imagePath: 'assets/images/pool5.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailsScreen(
                              selectedProjectIndex:
                                  1, // Index of the 'Pool Garden' image
                              allProjects: [
                                {
                                  'title': 'Modern Landscape',
                                  'imagePath': 'assets/images/modern1.jpg'
                                },
                                {
                                  'title': 'Pool Garden',
                                  'imagePath': 'assets/images/pool5.jpg'
                                },
                                {
                                  'title': 'Zen Garden',
                                  'imagePath': 'assets/images/Zen.jpg'
                                },
                                {
                                  'title': 'Playground Garden',
                                  'imagePath': 'assets/images/PlayGround.jpg'
                                },
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                // Floor Plan Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'Floor Plan of Landscape Garden',
                        style: TextStyle(
                          fontSize: 20, // Slightly larger text
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .black87, // Darker color for better contrast
                          letterSpacing:
                              0.5, // Adds slight spacing between letters
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          height: 200, // Adjusted height for better proportions
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.grey[200]!
                              ], // Subtle gradient
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12, // Softer shadow
                                blurRadius: 10,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: PageView.builder(
                            itemCount: 4, // Number of images
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final images = [
                                'assets/images/fp1.jpg',
                                'assets/images/fp2.jpg',
                                'assets/images/fp3.jpg',
                                'assets/images/fp4.jpg',
                              ];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              );
                            }),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 80,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: Colors.black54),
                            onPressed: () {
                              // Navigate to previous image
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 80,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.black54),
                            onPressed: () {
                              // Navigate to next image
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Top Deals and Offers Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Deals & Offers',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Display some offers
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[100],
                    ),
                    child: Center(
                      child: Text(
                        '50% Off on All Plants!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// GardenOptionCard widget definition
class GardenOptionCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  GardenOptionCard(
      {required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ProjectDetailsScreen to show 5 images when one is clicked
class ProjectDetailsScreen extends StatelessWidget {
  final int selectedProjectIndex;
  final List<Map<String, String>> allProjects;

  ProjectDetailsScreen(
      {required this.selectedProjectIndex, required this.allProjects});

  @override
  Widget build(BuildContext context) {
    // Adding a dummy 5th image for the selected project
    List<String> images = [
      allProjects[selectedProjectIndex]['imagePath']!,
      'assets/images/pool1.jpg',
      'assets/images/pool2.jpg',
      'assets/images/pool3.jpg',
      'assets/images/pool4.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pool Garden Project'),
        backgroundColor: Colors.green[600], // Dark green color
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Explore the details of this amazing garden design.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            // Grid of images with hover effect
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.0, // Square grid items
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Optionally, navigate to another screen with the full image
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
