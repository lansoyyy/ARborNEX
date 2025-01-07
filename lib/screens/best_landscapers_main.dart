import 'package:flutter/material.dart';
import 'package:landscape/screens/main_screen.dart';
import 'package:photo_view/photo_view.dart';

// FIRST LANDSCAPER
class HarrisonScreen extends StatelessWidget {
  const HarrisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background for contrast
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                children: [
                  // Background Shape
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16.0),

                        // Profile Content
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image with Shadow
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/image 1.png'),
                              ),
                            ),
                            const SizedBox(width: 16.0),

                            // Name and Title
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, I'm",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Harrison Grove",
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Landscape Architect",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16.0),

                        // Contact Info
                        const Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "(312) 555-0176",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "harrison.grove@gmail.com",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Why Hire Me Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why Hire Me?",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I'm committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.",
                          style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Project Gallery Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Project Gallery",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildZoomableImage(context, 'assets/images/indoor1.png'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/indoor3.jpg'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/indoor2.png'),
                  ],
                ),
              ),

              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZoomableImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageZoomScreen(imagePath: imagePath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Material(
          elevation: 4,
          child: Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageZoomScreen extends StatelessWidget {
  final String imagePath;

  const ImageZoomScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Designs"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
        ),
      ),
    );
  }
}

//SECOND LANDSCAPER
class JoshuaScreen extends StatelessWidget {
  const JoshuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background for contrast
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                children: [
                  // Background Shape
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16.0),

                        // Profile Content
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image with Shadow
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/image 2.png'),
                              ),
                            ),
                            const SizedBox(width: 16.0),

                            // Name and Title
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, I'm",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Jonie Josh Delocal",
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Landscape Architect",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16.0),

                        // Contact Info
                        const Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "(312) 555-0179",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "joniejosh@gmail.com",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Why Hire Me Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why Hire Me?",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "I blend a love for plants with a creative touch in landscape design, ensuring that each project reflects your unique vision. My expertise in choosing the right plants, designing harmonious garden spaces, and incorporating sustainable solutions allows me to create outdoor environments that are both beautiful and environmentally responsible. With a keen eye for detail, a passion for innovative design, and a commitment to excellence, I’m dedicated to transforming your outdoor space into a stunning reflection of your style.",
                          style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Project Gallery Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Project Gallery",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildZoomableImage(context, 'assets/images/balcony1.jpg'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/balcony2.png'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/balcony3.png'),
                  ],
                ),
              ),

              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZoomableImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageZoomScreen(imagePath: imagePath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Material(
          elevation: 4,
          child: Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageZoomScreen2 extends StatelessWidget {
  final String imagePath;

  const ImageZoomScreen2({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Designs"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
        ),
      ),
    );
  }
}

//THIRD LANDSCAPER
class AnnaScreen extends StatelessWidget {
  const AnnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background for contrast
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                children: [
                  // Background Shape
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16.0),

                        // Profile Content
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image with Shadow
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/image 3.png'),
                              ),
                            ),
                            const SizedBox(width: 16.0),

                            // Name and Title
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, I'm",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Hannah Hyacinth Lordinazo",
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Landscape Architect",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16.0),

                        // Contact Info
                        const Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "(312) 555-0177",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "hannahhyacinth@gmail.com@gmail.com",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Why Hire Me Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why Hire Me?",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.",
                          style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Project Gallery Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Project Gallery",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildZoomableImage(context, 'assets/images/outdoor1.png'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/outdoor2.png'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(context, 'assets/images/outdoor3.png'),
                  ],
                ),
              ),

              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZoomableImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageZoomScreen(imagePath: imagePath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Material(
          elevation: 4,
          child: Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageZoomScreen3 extends StatelessWidget {
  final String imagePath;

  const ImageZoomScreen3({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Designs"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
        ),
      ),
    );
  }
}

//FOURTH LANDSCAPER
class BenScreen extends StatelessWidget {
  const BenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background for contrast
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                children: [
                  // Background Shape
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16.0),

                        // Profile Content
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image with Shadow
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/image 4.png'),
                              ),
                            ),
                            const SizedBox(width: 16.0),

                            // Name and Title
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, I'm",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Ben George Steve",
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Landscape Architect",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16.0),

                        // Contact Info
                        const Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "(312) 555-2786",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              "bengeorge@gmail.com",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Why Hire Me Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why Hire Me?",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I'm committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.",
                          style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Project Gallery Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Project Gallery",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildZoomableImage(
                        context, 'assets/images/traditional1.jpg'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(
                        context, 'assets/images/traditional2.jpg'),
                    const SizedBox(height: 5),
                    _buildZoomableImage(
                        context, 'assets/images/traditional3.jpg'),
                  ],
                ),
              ),

              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZoomableImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageZoomScreen(imagePath: imagePath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Material(
          elevation: 4,
          child: Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageZoomScreen4 extends StatelessWidget {
  final String imagePath;

  const ImageZoomScreen4({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zoomable Image"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
        ),
      ),
    );
  }
}
