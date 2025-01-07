import 'package:flutter/material.dart';

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  List<Widget> gardenElements = [];

  void _addElement(Widget element) {
    setState(() {
      gardenElements.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Project'),
      ),
      body: Stack(
        children: [
          // Background: Lawn or Soil
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lawn_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Droppable Garden Elements
          ...gardenElements,
          // Floating Tools
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                _draggableTool(
                  label: 'Tree',
                  imagePath: 'assets/images/aa.webp',
                  size: 60.0,
                  onDrag: () => _addElement(
                      _gardenItem('assets/images/aa.webp', 100, 100)),
                ),
                SizedBox(width: 10),
                _draggableTool(
                  label: 'Flower',
                  imagePath: 'assets/images/ab.jpg',
                  size: 60.0,
                  onDrag: () => _addElement(
                      _gardenItem('assets/images/ab.jpg', 120, 200)),
                ),
                SizedBox(width: 10),
                _draggableTool(
                  label: 'Bench',
                  imagePath: 'assets/images/bb.jpg',
                  size: 60.0,
                  onDrag: () => _addElement(
                      _gardenItem('assets/images/bb.jpg', 150, 300)),
                ),
                SizedBox(width: 10),
                _draggableTool(
                  label: 'Fountain',
                  imagePath: 'assets/images/cd.jpg',
                  size: 60.0,
                  onDrag: () => _addElement(
                      _gardenItem('assets/images/cd.jpg', 200, 400)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _draggableTool({
    required String label,
    required String imagePath,
    double? size,
    required VoidCallback onDrag,
  }) {
    return Draggable(
      feedback: Image.asset(imagePath,
          width: size, height: size, opacity: AlwaysStoppedAnimation(0.5)),
      child: Column(
        children: [
          Image.asset(imagePath, width: size, height: size),
          Text(label),
        ],
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Image.asset(imagePath, width: size, height: size),
      ),
      onDragEnd: (details) => onDrag(),
    );
  }

  Widget _gardenItem(String imagePath, double x, double y) {
    return Positioned(
      left: x,
      top: y,
      child: Image.asset(imagePath, width: 50, height: 50),
    );
  }
}
