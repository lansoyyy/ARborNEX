import 'package:flutter/material.dart';
import 'package:landscape/screens/ReminderScreen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, String>> collections = [
    {'title': 'All favourites', 'image': 'assets/images/afg.png'},
    {'title': 'Rock Garden', 'image': 'assets/images/rrg.png'},
    {'title': 'Balcony Garden', 'image': 'assets/images/bbg.png'},
    {'title': 'Vertical Garden', 'image': 'assets/images/verg.png'},
    {'title': 'Window Garden', 'image': 'assets/images/wg.png'},
    {'title': 'Rooftop Garden', 'image': 'assets/images/roofg.png'},
    {'title': 'Vegetable Garden', 'image': 'assets/images/vg.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewReminderScreen()),
            );
          },
        ),
        title: const Text(
          'FAVOURITES',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1,
          ),
          itemCount: collections.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNewCollectionScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.green,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add New Collection',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            final collection = collections[index - 1];
            return GestureDetector(
              onTap: () {
                if (collection['title'] == 'Balcony Garden') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BalconyGardenScreen()),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(collection['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      collection['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BalconyGardenScreen extends StatefulWidget {
  const BalconyGardenScreen({super.key});

  @override
  State<BalconyGardenScreen> createState() => _BalconyGardenScreenState();
}

class _BalconyGardenScreenState extends State<BalconyGardenScreen> {
  final List<Map<String, String>> plants = [
    {
      'title': 'Snake Plant',
      'subtitle': 'Low Maintenance',
      'image': 'assets/images/plant4.png'
    },
    {
      'title': 'Aloe Vera',
      'subtitle': 'Medicinal Plant',
      'image': 'assets/images/aloe_vera.png'
    },
    {
      'title': 'Fiddle Leaf Fig',
      'subtitle': 'Indoor Tree',
      'image': 'assets/images/fiddle_leaf_fig.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Balcony Garden',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  plant['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                plant['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(plant['subtitle']!),
            ),
          );
        },
      ),
    );
  }
}

class AddNewCollectionScreen extends StatefulWidget {
  const AddNewCollectionScreen({super.key});

  @override
  _AddNewCollectionScreenState createState() => _AddNewCollectionScreenState();
}

class _AddNewCollectionScreenState extends State<AddNewCollectionScreen> {
  final List<Map<String, dynamic>> gardenPlants = [
    {
      'title': 'Calla Lily',
      'subtitle': 'Indirect Lighting',
      'image': 'assets/images/plant3.png'
    },
    {
      'title': 'Terrarium',
      'subtitle': 'Indoor Type',
      'image': 'assets/images/plant2.png'
    },
    {
      'title': 'Bonsai Tree',
      'subtitle': 'Miniature Type',
      'image': 'assets/images/bt.png'
    },
  ];

  final List<Map<String, dynamic>> discoverPlants = [
    {
      'title': 'Snake Plant',
      'subtitle': 'Low Maintenance',
      'image': 'assets/images/plant4.png',
      'liked': false
    },
    {
      'title': 'Aloe Vera',
      'subtitle': 'Medicinal Plant',
      'image': 'assets/images/av.png',
      'liked': false
    },
    {
      'title': 'Fiddle Leaf Fig',
      'subtitle': 'Indoor Tree',
      'image': 'assets/images/fl.png',
      'liked': false
    },
    {
      'title': 'Peace Lily',
      'subtitle': 'Air Purifier',
      'image': 'assets/images/pl.png',
      'liked': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
          },
        ),
        title: const Text(
          'Garden',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal scrollable plants
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gardenPlants.length,
                  itemBuilder: (context, index) {
                    final plant = gardenPlants[index];
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(plant['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          plant['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Other sections
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Discover new plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: discoverPlants.length,
              itemBuilder: (context, index) {
                final plant = discoverPlants[index];
                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        plant['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(plant['title']!),
                    subtitle: Text(plant['subtitle']!),
                    trailing: IconButton(
                      icon: Icon(
                        plant['liked'] ? Icons.favorite : Icons.favorite_border,
                        color: plant['liked'] ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          plant['liked'] = !plant['liked'];
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
