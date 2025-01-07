import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landscape/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Bounce Animation for Logo
    _logoAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    // Slide Up and Fade Animation for Text
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();

    // Navigate to GetStartedScreen after a delay
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade900, Colors.green.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo with Bounce Effect
              ScaleTransition(
                scale: _logoAnimation,
                child: Image.asset(
                  'assets/images/arbornex_logo.png', // Replace with your logo asset
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 30),
              // Animated Text with Slide and Fade Effect
              SlideTransition(
                position: _textSlideAnimation,
                child: const Text(
                  'ARborNex',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Discover Your Dream Garden with AR",
      "description":
          "Ready to bring your landscape ideas to life? Dive into an immersive experience where you can visualize, design, and refine your garden with ease.",
      "image": "assets/images/image-1.png",
    },
    {
      "title": "Turn your landscape Vision into reality",
      "description":
          "Ready to create your own outdoor sanctuary? Discover and buy plants that will transform your space into a vibrant, lush paradise. Let's get growing!",
      "image": "assets/images/image.png",
    },
    {
      "title": "Create a Living Landscape - Choose Your Plants Today!",
      "description":
          "Explore a world of beautiful plants perfect for your landscape. Choose, place, and visualize each plant with AR before you buy—turn your garden dreams into reality!",
      "image": "assets/images/image-3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                        ),
                        child: Image.asset(
                          data['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data['description']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  },
                  child: const Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: _currentPage == index ? 35.0 : 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentPage != 2) {
                      setState(() {
                        _currentPage++;
                      });
                      _pageController.animateToPage(
                        _currentPage,
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.bounceIn,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()),
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_circle_right_rounded,
                    color: Colors.green[700],
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
