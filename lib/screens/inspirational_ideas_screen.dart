import 'package:flutter/material.dart';

class BalconyInspirationalIdeasScreen extends StatelessWidget {
  const BalconyInspirationalIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'INSPIRATION IDEAS',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the image background
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            leading: null, // This ensures no back arrow in the SliverAppBar
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/balconyinspo.png', // Replace with your asset image
                height: 50,
                width: 50,
                fit: BoxFit
                    .cover, // You can use BoxFit.cover or another value based on your needs
              ),
            ),
          ),
          // The main content that scrolls
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Title and Heart Icon Section (Title on the left, Heart icon on the right)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Balcony Gardening',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.green),
                    ],
                  ),
                ),

                // Description Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Indoor landscaping offers endless possibilities to bring nature into your home! You can transform any corner or shelf into a mini-garden by using unique containers, like repurposed jars or hanging planters, which add both greenery and a stylish touch to the space. Consider plants that thrive indoors, like snake plants, pothos, or small palms, to create a cozy and lively ambiance. Incorporating vertical gardens, tiered stands, or wall-mounted planters can also make the most of limited floor space, allowing you to enjoy a lush indoor environment without overcrowding.\n For those short on floor space, vertical gardens, tiered plant stands, or wall-mounted planters are fantastic options, making it easy to add layers of greenery without overcrowding. These arrangements provide depth and texture, allowing you to display a variety of plants at different heights, from cascading vines to compact succulents, creating a dynamic, lush environment.\n Beyond aesthetics, indoor landscaping can introduce a calming ritual into your daily life, as you care for and nurture each plant. Each green addition not only elevates your living space but also infuses it with a sense of peace, transforming your home into a nurturing retreat that celebrates the beauty of nature indoors.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),

                // Sliding Images Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/balconyinspo1.png', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/balconyinspo.png', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/balcony2.png', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Suggested Plants Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Suggested Balcony Plants',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),

                // Suggested Plants Section with Sliding Images
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/snakeplant.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Snake Planr',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/siit.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Siit - Siit',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/cactus.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Cactus',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/tulips.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Tulips',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                      ],
                    ),
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

// "Growing plants in a limited space can be a challenge, even for experienced gardeners, but it’s also a fantastic opportunity to let creativity take the lead and make the most of every inch. The journey begins with deciding what to grow—perhaps a small urban vegetable garden to provide fresh, homegrown herbs and veggies, or maybe a cozy tropical paradise with lush, leafy plants that thrive indoors.\n The choice of containers adds another layer of excitement to the project. You can go beyond traditional pots by using imaginative options like repurposed vintage cans, old ceramic mugs, or wooden crates, which add a unique, personalized look. A hanging basket can be great for vining plants, while tiered plant stands work well to create a vertical garden, optimizing space and enhancing visual interest.\n Once you've set up your plants, caring for them becomes a rewarding routine. In small, confined spaces, regular attention to light levels, humidity, and watering is essential, as plants may need adjustments to stay healthy in their limited environment. By experimenting with arrangement and care, you’ll turn the strict confines of your space into a thriving, green oasis that reflects both nature and your personality. The entire process is a blend of patience, experimentation, and artistry—a true adventure in indoor gardening!",
//INDOOR
class IndoorInspirationalIdeasScreen extends StatelessWidget {
  const IndoorInspirationalIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'INSPIRATION IDEAS',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the image background
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            leading: null, // This ensures no back arrow in the SliverAppBar
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/indoorinspo.png', // Replace with your asset image
                height: 50,
                width: 50,
                fit: BoxFit
                    .cover, // You can use BoxFit.cover or another value based on your needs
              ),
            ),
          ),
          // The main content that scrolls
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Title and Heart Icon Section (Title on the left, Heart icon on the right)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Indoor Gardening',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.green),
                    ],
                  ),
                ),

                // Description Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Indoor landscaping offers endless possibilities to bring nature into your home! You can transform any corner or shelf into a mini-garden by using unique containers, like repurposed jars or hanging planters, which add both greenery and a stylish touch to the space. Consider plants that thrive indoors, like snake plants, pothos, or small palms, to create a cozy and lively ambiance. Incorporating vertical gardens, tiered stands, or wall-mounted planters can also make the most of limited floor space, allowing you to enjoy a lush indoor environment without overcrowding.\n For those short on floor space, vertical gardens, tiered plant stands, or wall-mounted planters are fantastic options, making it easy to add layers of greenery without overcrowding. These arrangements provide depth and texture, allowing you to display a variety of plants at different heights, from cascading vines to compact succulents, creating a dynamic, lush environment.\n Beyond aesthetics, indoor landscaping can introduce a calming ritual into your daily life, as you care for and nurture each plant. Each green addition not only elevates your living space but also infuses it with a sense of peace, transforming your home into a nurturing retreat that celebrates the beauty of nature indoors.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),

                // Sliding Images Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/indoor3.jpg', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/indoor1.png', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/indoor2.png', // Replace with your asset image
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Suggested Plants Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Suggested Indoor Plants',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),

                // Suggested Plants Section with Sliding Images
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/grey.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Grey Star Calathea',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/terrarium.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Terrarium',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/welcome.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Welcome Plant',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/calla.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Calla Lily',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                      ],
                    ),
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

//OUTDOOR
class OutdoorInspirationalIdeasScreen extends StatelessWidget {
  const OutdoorInspirationalIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'INSPIRATION IDEAS',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the image background
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            leading: null, // This ensures no back arrow in the SliverAppBar
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/outdoorinspo.png', // Replace with your asset image
                height: 50,
                width: 50,
                fit: BoxFit
                    .cover, // You can use BoxFit.cover or another value based on your needs
              ),
            ),
          ),
          // The main content that scrolls
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Title and Heart Icon Section (Title on the left, Heart icon on the right)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Outdoor Gardening',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.green),
                    ],
                  ),
                ),

                // Description Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Outdoor landscape design is all about crafting an inviting, functional, and beautiful outdoor space that blends nature and structure in harmony. It involves strategically arranging plants, hardscapes, and other elements to create a balanced environment that complements the natural surroundings while enhancing usability and aesthetics.\n A typical outdoor design might feature pathways winding through vibrant garden beds, offering both visual appeal and easy navigation. Thoughtfully chosen plants, such as flowering shrubs, perennials, and ornamental grasses, create a rich tapestry of color and texture throughout the seasons. Trees are often included to provide shade and structure, anchoring the design and establishing focal points.\n Hardscape elements—such as stone patios, garden walls, or wooden pergolas—add contrast and depth, while water features, like fountains or small ponds, introduce a sense of tranquility with their gentle sounds. Lighting plays a crucial role too, highlighting key features at night and creating a warm, inviting atmosphere.\n Outdoor landscape design aims to create an extension of indoor living, whether through cozy seating areas, outdoor kitchens, or fire pits. The ultimate goal is to design an outdoor sanctuary that feels like an escape into nature, reflecting the homeowner’s style and seamlessly integrating with the surrounding environment.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),

                // Sliding Images Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/outdoor2.png',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/outdoor1.png',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/outdoor3.png',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Suggested Plants Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Suggested Outdoor Plants',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),

                // Suggested Plants Section with Sliding Images
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/tapiora.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Tapiary Plants',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/umbrela.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Umbrella Bamboo',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/monstera.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Monstera Plant',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/ferns1.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Ferns',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                      ],
                    ),
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

//Traditional
class TraditionalInspirationalIdeasScreen extends StatelessWidget {
  const TraditionalInspirationalIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'INSPIRATION IDEAS',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the image background
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            leading: null, // This ensures no back arrow in the SliverAppBar
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/traditionalinspo.png', // Replace with your asset image
                height: 50,
                width: 50,
                fit: BoxFit
                    .cover, // You can use BoxFit.cover or another value based on your needs
              ),
            ),
          ),
          // The main content that scrolls
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Title and Heart Icon Section (Title on the left, Heart icon on the right)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Traditional Gardening',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.green),
                    ],
                  ),
                ),

                // Description Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Traditional landscaping emphasizes classic design principles, symmetry, and balance to create timeless, orderly outdoor spaces. It often includes well-defined garden beds, manicured lawns, and carefully selected plants that complement each other in both form and color. The overall layout usually follows a structured design, with pathways, hedges, or stone borders creating clear divisions between different areas of the garden.\n This style of landscaping frequently incorporates familiar plantings like roses, boxwoods, hydrangeas, and evergreens to achieve a rich, layered look. Shrubs and flowering perennials are often arranged in neat rows or clusters, with seasonal blooms providing bursts of color and year-round interest. Trees and large shrubs act as focal points, creating shade and adding structure.\n Hardscape elements in traditional landscaping—such as brick or stone patios, classic fountains, wrought-iron benches, and arched trellises—complement the natural elements while adding elegance and functionality. Garden paths and walkways often feature traditional materials like flagstone or cobblestone, guiding visitors through the garden with a sense of flow.\n Lighting is typically subtle and warm, often placed along pathways or around focal points to highlight the garden's beauty at night. Traditional landscaping strives for an organized, peaceful aesthetic, where every feature contributes to a harmonious and enduring outdoor space.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),

                // Sliding Images Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/traditional3.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/traditional2.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/traditional1.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Suggested Plants Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Suggested Traditioanal Plants',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),

                // Suggested Plants Section with Sliding Images
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/mad.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Madhuriam',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/nayan.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Nayantora',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/bor.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Bormanimuni',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/tita.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text('Titaphul',
                                style: TextStyle(color: Colors.grey[800])),
                          ],
                        ),
                      ],
                    ),
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
