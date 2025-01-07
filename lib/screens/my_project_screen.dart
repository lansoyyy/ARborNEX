import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landscape/screens/planner_screen.dart';
import 'package:video_player/video_player.dart';

class ArborNexScreen extends StatefulWidget {
  const ArborNexScreen({super.key});

  @override
  _ArborNexScreenState createState() => _ArborNexScreenState();
}

class _ArborNexScreenState extends State<ArborNexScreen> {
  File? _selectedImage;

  // Picks an image and navigates to GalleryScreen
  void _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }

    // Navigate to the GalleryScreen regardless of whether an image is picked
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryScreen(),
        ));
  }

  void _showNewProjectPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              _buildOptionTile(
                icon: Icons.photo,
                title: 'Gallery',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryScreen(),
                    ),
                  );
                },
              ),
              _buildOptionTile(
                icon: Icons.camera,
                title: 'Camera',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      // Remove the BottomNavigationBar widget
      bottomNavigationBar: null,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'ARborNEX',
        style: TextStyle(
          color: Colors.green,
          fontSize: 22,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.green),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.green),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/profiless.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: _buildSearchBar(),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _buildMainContent(),
        ),
      ],
    );
  }

  TextField _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: 'Search Plants, Products',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: _selectedImage == null
                  ? Image.asset(
                      'assets/images/machoo.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      _selectedImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              right: -30,
              bottom: 80,
              child: _buildNewProjectButton(),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Text(
          'Customize your project',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildNewProjectButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          _showNewProjectPopup(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        ),
        child: const Text(
          'New Project',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  // List of image paths for the gallery
  final List<String> images = [
    'assets/images/img7.jpg',
    'assets/images/img4.png',
    'assets/images/img3.png',
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img5.png',
  ];

  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.green),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (images[index] == 'assets/images/img7.jpg') {
                  // Show a dialog or perform a custom action
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Image Clicked'),
                      content: const Text('You clicked on img7.jpg!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlannerScreen(), // when click thhe ok
                              ),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Optional: Handle other image clicks here
                  print('Clicked on image: ${images[index]}');
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Rounded corners
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover, // Image scaling
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(); // Automatically initialize the video player[]
  }

  // Initialize video player for asset
  void _initializeVideoPlayer() {
    _videoPlayerController =
        VideoPlayerController.asset('assets/images/videos/ar.mp4')
          ..initialize().then((_) {
            setState(() {}); // Refresh the UI to display the video player
            _videoPlayerController!.play(); // Automatically play the video
          }).catchError((error) {
            print("Error initializing video player: $error");
          });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player from Assets'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _videoPlayerController != null &&
                _videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              )
            : const CircularProgressIndicator(), // Display loader until the video is ready
      ),
    );
  }
}
