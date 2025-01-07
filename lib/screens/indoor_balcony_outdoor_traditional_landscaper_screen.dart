import 'package:flutter/material.dart';
import 'package:landscape/screens/main_screen.dart';

import 'details_screen.dart';

//INDOOR ARTIST
class IndoorLandscaperScreen extends StatelessWidget {
  const IndoorLandscaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: const Center(
          child: Text(
            "INDOOR LANDSCAPING",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004422)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF004422),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Landscaper Expert",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 1.png',
                    "Harrison Grove ",
                    "(312) 555-2090",
                    "harrison@gmail.com",
                    'I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I’m committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.',
                    'Additional information for project 1.',
                    "123",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 2.png',
                    'Jonie Josh Delocal',
                    "(312) 555-0179",
                    "joniejos@gmail.com",
                    'I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.',
                    'Additional information for project 2.',
                    "456",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 3.png',
                    'Hannah Francheska Lopez',
                    "(312) 555-5080",
                    "hannahh@gmail.com",
                    'I bring a deep passion for plants and a creative flair for landscape design to every project, ensuring your outdoor space truly represents your vision. With expertise in selecting the perfect plants, crafting beautiful garden layouts, and applying sustainable practices, I aim to create landscapes that are both breathtaking and eco-friendly. My focus on detail, innovative solutions, and commitment to outstanding results make me the ideal choice for bringing your landscape dreams to life.',
                    'Additional information for project 3.',
                    "789",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 4.png',
                    'Neoil Retol',
                    "(312) 555-6070",
                    "cyril@gmail.com",
                    'I blend a love for plants with a creative touch in landscape design, ensuring that each project reflects your unique vision. My expertise in choosing the right plants, designing harmonious garden spaces, and incorporating sustainable solutions allows me to create outdoor environments that are both beautiful and environmentally responsible. With a keen eye for detail, a passion for innovative design, and a commitment to excellence, I’m dedicated to transforming your outdoor space into a stunning reflection of your style.',
                    'Additional information for project 4.',
                    "1102",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String imagePath,
    String title,
    String number,
    String email,
    String description,
    String additionalInfo,
    String likes,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              imagePath: imagePath, // Passing the imagePath here
              title: title,
              number: number,
              email: email,
              projectDescription: description,
              additionalInfo: additionalInfo,
              likes: likes,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 185,
          height: 250,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Positioned(
                left: -8,
                top: 20,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Stack(
                    children: [
                      Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                      const Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004422),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.green,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//OUTDOOR ARTIST
class OutdoorLandscapingScreen extends StatelessWidget {
  const OutdoorLandscapingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: const Center(
          child: Text(
            "OUTDOOR LANDSCAPING",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004422)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF004422),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Landscaper Expert",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 1.png',
                    "Harrison Grove ",
                    "(312) 555-2090",
                    "harrison@gmail.com",
                    'I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I’m committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.',
                    'Additional information for project 1.',
                    "123",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 7.png',
                    'Januar Biron',
                    "(312) 555-2878",
                    "januar@gmail.com",
                    'I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.',
                    'Additional information for project 2.',
                    "456",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 5.png',
                    'Trisha Anne Fernandez',
                    "(312) 555-5030",
                    "trisha@gmail.com",
                    'I bring a deep passion for plants and a creative flair for landscape design to every project, ensuring your outdoor space truly represents your vision. With expertise in selecting the perfect plants, crafting beautiful garden layouts, and applying sustainable practices, I aim to create landscapes that are both breathtaking and eco-friendly. My focus on detail, innovative solutions, and commitment to outstanding results make me the ideal choice for bringing your landscape dreams to life.',
                    'Additional information for project 3.',
                    "789",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 8.png',
                    'Ronald Marcus',
                    "(312) 555-4080",
                    "marcus@gmail.com",
                    'I blend a love for plants with a creative touch in landscape design, ensuring that each project reflects your unique vision. My expertise in choosing the right plants, designing harmonious garden spaces, and incorporating sustainable solutions allows me to create outdoor environments that are both beautiful and environmentally responsible. With a keen eye for detail, a passion for innovative design, and a commitment to excellence, I’m dedicated to transforming your outdoor space into a stunning reflection of your style.',
                    'Additional information for project 4.',
                    "1102",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String imagePath,
    String title,
    String number,
    String email,
    String description,
    String additionalInfo,
    String likes,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              imagePath: imagePath, // Passing the imagePath here
              title: title,
              number: number,
              email: email,
              projectDescription: description,
              additionalInfo: additionalInfo,
              likes: likes,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 185,
          height: 250,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Positioned(
                left: -8,
                top: 20,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Stack(
                    children: [
                      Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                      const Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004422),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.green,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//BALCONY ARTIST
class BalconyLandscaperScreen extends StatelessWidget {
  const BalconyLandscaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: const Center(
          child: Text(
            "BALCONY LANDSCAPING",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004422)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF004422),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Landscaper Expert",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 9.png',
                    "Niel John Renti",
                    "(312) 555-0176",
                    "harrison.grove@gmail.com",
                    'I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I’m committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.',
                    'Additional information for project 1.',
                    "123",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 10.png',
                    'Hannah Hyacinth Lordinazo',
                    "(312) 555-0177",
                    "hannahhyacinth@gmail.com",
                    'I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.',
                    'Additional information for project 2.',
                    "456",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 4.png',
                    'Neoil Retol',
                    "(312) 555-3080",
                    "jon@gmail.com",
                    'I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.',
                    'Additional information for project 2.',
                    "789",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 2.png',
                    'Jonie Josh Delocal',
                    "(312) 555-0179",
                    "joniejosh@gmail.com",
                    'I blend a love for plants with a creative touch in landscape design, ensuring that each project reflects your unique vision. My expertise in choosing the right plants, designing harmonious garden spaces, and incorporating sustainable solutions allows me to create outdoor environments that are both beautiful and environmentally responsible. With a keen eye for detail, a passion for innovative design, and a commitment to excellence, I’m dedicated to transforming your outdoor space into a stunning reflection of your style.',
                    'Additional information for project 4.',
                    "1102",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String imagePath,
    String title,
    String number,
    String email,
    String description,
    String additionalInfo,
    String likes,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              imagePath: imagePath, // Passing the imagePath here
              title: title,
              number: number,
              email: email,
              projectDescription: description,
              additionalInfo: additionalInfo,
              likes: likes,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 185,
          height: 250,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Positioned(
                left: -8,
                top: 20,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Stack(
                    children: [
                      Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                      const Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004422),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.green,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TRADITIONAL ARTIST
class TraditionalLandscaperScreen extends StatelessWidget {
  const TraditionalLandscaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: const Center(
          child: Text(
            "TRADITIOANAL LANDSCAPING",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004422)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF004422),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Landscaper Expert",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 1.png',
                    "Harrison Grove",
                    "(312) 555-2090",
                    "harrison.grove@gmail.com",
                    'I bring a unique blend of horticulture expertise, landscape creativity, and dedication to every project. With a strong background in plant selection, garden design, and sustainable landscaping practices, I’m committed to delivering high-quality results that align with your vision and enhance your outdoor space. My attention to detail, problem-solving skills, and focus on client satisfaction make me an ideal choice for your landscaping needs.',
                    'Additional information for project 1.',
                    "123",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 4.png',
                    'Neoil Retol',
                    "(312) 555-3080",
                    "jon@gmail.com",
                    'I combine a passion for horticulture with an artistic approach to landscaping, ensuring each project reflects your unique style. With extensive experience in selecting the right plants, designing vibrant gardens, and using eco-friendly practices, I strive to create stunning outdoor spaces. My commitment to precision, creative problem-solving, and delivering exceptional results makes me the perfect partner for transforming your landscape.',
                    'Additional information for project 2.',
                    "456",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCard(
                    context,
                    'assets/images/image 3.png',
                    'Hannah Francheska Lopez',
                    "(312) 555-5080",
                    "hannahh@gmail.com",
                    'I bring a deep passion for plants and a creative flair for landscape design to every project, ensuring your outdoor space truly represents your vision. With expertise in selecting the perfect plants, crafting beautiful garden layouts, and applying sustainable practices, I aim to create landscapes that are both breathtaking and eco-friendly. My focus on detail, innovative solutions, and commitment to outstanding results make me the ideal choice for bringing your landscape dreams to life.',
                    'Additional information for project 3.',
                    "789",
                  ),
                  buildCard(
                    context,
                    'assets/images/image 2.png',
                    'Jonie Josh Delocal',
                    "(312) 555-0179",
                    "joniejosh@gmail.com",
                    'I blend a love for plants with a creative touch in landscape design, ensuring that each project reflects your unique vision. My expertise in choosing the right plants, designing harmonious garden spaces, and incorporating sustainable solutions allows me to create outdoor environments that are both beautiful and environmentally responsible. With a keen eye for detail, a passion for innovative design, and a commitment to excellence, I’m dedicated to transforming your outdoor space into a stunning reflection of your style.',
                    'Additional information for project 4.',
                    "1102",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String imagePath,
    String title,
    String number,
    String email,
    String description,
    String additionalInfo,
    String likes,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              imagePath: imagePath, // Passing the imagePath here
              title: title,
              number: number,
              email: email,
              projectDescription: description,
              additionalInfo: additionalInfo,
              likes: likes,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 185,
          height: 250,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Positioned(
                left: -8,
                top: 20,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Stack(
                    children: [
                      Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                      const Text(
                        "Landscape Architecture",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004422),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.green,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
