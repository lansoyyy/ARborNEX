import 'package:flutter/material.dart';

class TopDealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOP DEALS AND OFFERS', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
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
                decoration: InputDecoration(
                  hintText: 'Search Plants, Products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Featured Deal
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlLzEyOTE3MC9GNDE0OEU0MS0zNTQ1LTRERTEtOTZDRC1CMTQ3RkQyOTQyQzUucG5n?format=pjpeg&optimize=high&auto=webp&width=450',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(Icons.local_fire_department,
                              color: Colors.red, size: 28),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phalaenopsis Aphrodite',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              Icon(Icons.star_half,
                                  color: Colors.yellow, size: 16),
                              SizedBox(width: 4),
                              Text('(158)',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Phalaenopsis Aphrodite is an epiphytic orchid with purple-tipped roots.',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '\$350',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '\$99.99',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Hot Deals
              Text('Hot Deals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HotDealCard(
                      imageUrl:
                          'https://www.southernliving.com/thmb/xiQxcEvhTBshyqqAw3PCXObDhTc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2046601_motho047_1-2000-66eca5df1ccb46148ffaab7ed2987fed.jpg',
                      title: 'Moth Orchid',
                    ),
                    HotDealCard(
                      imageUrl:
                          'https://philippineplants.wordpress.com/wp-content/uploads/2016/02/dendrobium-3.jpg',
                      title: 'Dendobrium',
                    ),
                    HotDealCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfSHSmupAha3-4o79A67f4baU7LrMMO-3awQ&s',
                      title: 'Palm Tree',
                    ),
                    HotDealCard(
                      imageUrl:
                          'https://media.greg.app/Y2FyZS1wbGFudC1wcm9maWxlLzU2NjgvRTA3ODY0NzgtREI1NC00MjcwLUFDRTItQjY5MTFDRDhBNUU4LnBuZw==?format=pjpeg&optimize=high&auto=webp&width=450',
                      title: 'Ball Cactus',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Featured Deals
              Text('Featured Deals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 2,
                children: [
                  FeaturedDealCard(
                    imageUrl:
                        'https://www.southernliving.com/thmb/cHqjhfymx39LLIq00ND_aEEQ3fw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-511790642-2000-6fe26923bfb040cab1ebcf930a5933ca.jpg',
                    title: 'Holiday Cactus',
                  ),
                  FeaturedDealCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1604938814491-c696899ec59b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8emVuJTIwc3RvbmVzfGVufDB8fDB8fHww',
                    title: 'Zen Stones',
                  ),
                  FeaturedDealCard(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRozSTl3RjAD7xZrfmswAYKiuMh3DMwAdcx2w&s',
                    title: 'Oldie Gnome',
                  ),
                  FeaturedDealCard(
                    imageUrl:
                        'https://www.realsimple.com/thmb/P9g1f-xU0Zr2cq2_3dMwfXizZcM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/impossible-to-kill-outdoor-plants-1-2000-f513b0574cb04674a1bce40b832b28dd.jpg',
                    title: 'Outdoor Plants',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotDealCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  HotDealCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 80, fit: BoxFit.cover),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FeaturedDealCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  FeaturedDealCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 80, fit: BoxFit.cover),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
