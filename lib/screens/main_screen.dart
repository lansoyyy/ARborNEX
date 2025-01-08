import 'package:flutter/material.dart';
import 'package:landscape/helpers/plant_data.dart';
import 'package:landscape/screens/best_landscapers_main.dart';
import 'package:landscape/screens/garden_planner_screen.dart';
import 'package:landscape/screens/indoor_balcony_outdoor_traditional_landscaper_screen.dart';
import 'package:landscape/screens/inspirational_ideas_screen.dart';
import 'package:landscape/screens/my_project_screen.dart';
import 'package:landscape/screens/plant_detail_screen.dart';
import 'package:landscape/screens/reminder_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ArborNexScreen(), // Replace placeholder with the actual screen
    GardenPlannerScreen(),
    const HireScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_florist), label: 'My Project'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Garden Planner'),
          BottomNavigationBarItem(icon: Icon(Icons.handyman), label: 'Hire'),
        ],
      ),
    );
  }
}

String searched = '';
final search = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(searched);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ARborNEX',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReminderScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                controller: search,
                onChanged: (value) {
                  setState(() {
                    searched = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for plants, tools, and more',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Section: Inspirational Ideas
              const Text(
                'Inspirational Ideas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the IndoorLandscaperScreen when the image is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BalconyInspirationalIdeasScreen()),
                        );
                      },
                      child: buildIdeaCard('BALCONY GARDENING',
                          'assets/images/balconyinspo.png', context),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the IndoorLandscaperScreen when the image is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IndoorInspirationalIdeasScreen()),
                        );
                      },
                      child: buildIdeaCard('INDOOR LANDSCAPING',
                          'assets/images/indoorinspo.png', context),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the IndoorLandscaperScreen when the image is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const OutdoorInspirationalIdeasScreen()),
                        );
                      },
                      child: buildIdeaCard('OUTDOOR LANDSCAPING',
                          'assets/images/outdoorinspo.png', context),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the IndoorLandscaperScreen when the image is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TraditionalInspirationalIdeasScreen()),
                        );
                      },
                      child: buildIdeaCard('TRADITIONAL LANDSCAPING',
                          'assets/images/traditionalinspo.png', context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Section: Diversed Plant Varieties
              const Text(
                'Diversed Plant Varieties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Builder(builder: (context) {
                final filteredPlants = plants.where((element) {
                  return element.name
                      .toLowerCase()
                      .contains(searched.toLowerCase());
                }).toList();
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Example for Snake Plant
                      // Filter the plants list based on the search query

                      // Iterate over the filtered list
                      for (int i = 0; i < filteredPlants.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailScreen(
                                    plantName: filteredPlants[i].name,
                                    plantImage:
                                        'assets/images/new/${filteredPlants[i].name}.png',
                                    plantDescription:
                                        filteredPlants[i].description,
                                    plantCareInstructions:
                                        filteredPlants[i].tips,
                                  ),
                                ),
                              );
                            },
                            child: buildPlantCircle(
                              filteredPlants[i].name,
                              'assets/images/new/${filteredPlants[i].name}.png',
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 16),

              // Section: Best Collections
              const Text(
                'Best Collections',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your navigation logic here, for example:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HarrisonScreen(), // Replace with your screen
                        ),
                      );
                    },
                    child: buildCollectionCard('Harrison Grove | Indoor Design',
                        'assets/images/indoor1.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your navigation logic here, for example:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const JoshuaScreen(), // Replace with your screen
                        ),
                      );
                    },
                    child: buildCollectionCard(
                        'Jonie Josh Delocal | Balcony Design',
                        'assets/images/balcony1.jpg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your navigation logic here, for example:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AnnaScreen(), // Replace with your screen
                        ),
                      );
                    },
                    child: buildCollectionCard(
                        'Hannah Hyacinth Lordinazo | Outdoor Design',
                        'assets/images/outdoor1.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your navigation logic here, for example:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BenScreen(), // Replace with your screen
                        ),
                      );
                    },
                    child: buildCollectionCard(
                        'Neoil Retol | Traditioanl Design',
                        'assets/images/traditional1.jpg'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIdeaCard(String title, String imagePath, BuildContext context,
      {Widget? navigateTo}) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Title Text
          Positioned(
            top: 8,
            left: 8,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // Heart Icon
          const Positioned(
            bottom: 8,
            right: 8,
            child: Icon(
              Icons.favorite_border,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlantCircle(String title, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildCollectionCard(String title, String imagePath) {
    return Column(
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
        ),
      ],
    );
  }
}

class HireScreen extends StatelessWidget {
  const HireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hire a Landscaper Expert',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReminderScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/landscaper.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'HIRE A\nLANDSCAPER\nEXPERT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 16),

              // Section Title
              const Text(
                'Find A Landscape Expert Near You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Landscape Categories
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCategoryCard('Indoor Gardening',
                        'assets/images/indoor_gardening.png', context,
                        navigateTo: IndoorLandscaperScreen(
                          type: 'Indoor Gardening',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCategoryCard('Balcony Landscaping',
                        'assets/images/balcony_landscaping.png', context,
                        navigateTo: IndoorLandscaperScreen(
                          type: 'Balcony Landscaping',
                        )),
                  ),
                ],
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCategoryCard('Outdoor Landscaping',
                        'assets/images/outdoor_landscaping.png', context,
                        navigateTo: IndoorLandscaperScreen(
                          type: 'Outdoor Landscaping',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCategoryCard('Traditional Landscaping',
                        'assets/images/traditional_landscaping.png', context,
                        navigateTo: IndoorLandscaperScreen(
                          type: 'Traditional Landscaping',
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryCard(String title, String imagePath, BuildContext context,
      {Widget? navigateTo}) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigateTo));
        }
      },
      child: Stack(
        children: [
          // Background image with rounded corners
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6), // Top part of the gradient
                  Colors.black.withOpacity(0.3), // Middle part
                  Colors.transparent, // Bottom part of the gradient
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content on top of the gradient
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
