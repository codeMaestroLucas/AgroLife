import 'package:flutter/material.dart';

class TemporaryImageScreen extends StatefulWidget {
  final String image;
  final Widget destinationScreen;
  final Duration duration;

  const TemporaryImageScreen({
    super.key,
    required this.image,
    required this.destinationScreen,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<TemporaryImageScreen> createState() => _TemporaryImageScreenState();
}

class _TemporaryImageScreenState extends State<TemporaryImageScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreenAfterDelay();
  }

  Future<void> _navigateToNextScreenAfterDelay() async {
    await Future.delayed(widget.duration);
    if (mounted) { // Check if the widget is still in the widget tree before navigating
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.destinationScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Optional: for full screen image
      body: Center(
        child: Image.asset(
          widget.image,
          fit: BoxFit.contain, // Adjust as needed
        ),
      ),
    );
  }
}
