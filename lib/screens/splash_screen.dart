import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:landscape/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Fade animation for the logo
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start animation
    _controller.forward();

    // Navigate to the next screen after the animation (e.g., Home screen)
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedScreen()),
        );
      });
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
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.75,
            image: AssetImage(
                'assets/images/new/image 7.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/new/iPhone 14 & 15 Pro Max - 1.png', // Replace with your logo image
                  width: 300,
                  height: 300,
                ),
              ],
            ),
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
