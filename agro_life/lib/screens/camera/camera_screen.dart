import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/camera/deceased_cow_info_screen.dart';
import 'package:agro_life/screens/camera/qr_code_detail_screen.dart';
import 'package:agro_life/screens/camera/temporary_image_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _setUpCameraController();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }


  Future<void> _setUpCameraController() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
        cameraController = CameraController(
          _cameras.first,
          ResolutionPreset.high,
        );
      });
    }
    cameraController
        ?.initialize()
        .then((_) {
          if (!mounted) return;
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                break;
              default:
                break;
            }
          }
        });
  }


  void _handlePointerDown(PointerDownEvent event) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = event.position.dx;

    String selectedImagePath;
    Widget destinationScreen; // The screen to navigate to AFTER the temporary image

    if (dx < screenWidth / 2) {
      selectedImagePath = 'assets/images/deceased_cow.jpg';
      destinationScreen = const DeceasedCowInfoScreen();
    } else {
      selectedImagePath = 'assets/images/qr_code.png';
      destinationScreen = const QRCodeDetailsScreen();
    }

    // Navigate to the temporary screen that shows the image for a few seconds
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TemporaryImageScreen(
          image: selectedImagePath,
          destinationScreen: destinationScreen,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUi());
  }

  Widget _buildUi() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        // Camera Preview with click listener
        Positioned.fill(
          child: Listener(
            onPointerDown: _handlePointerDown,
            behavior: HitTestBehavior.translucent,
            
            child: CameraPreview(cameraController!),
          ),
        ),

        // Back Button
        Positioned(
          top: 16,
          left: 16,

          child: SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),

        // Camera Button
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,

            child: GestureDetector(
              onTap: () {
                debugPrint('📸 Camera button tapped');
              },

              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.camera_alt_rounded,
                  size: sizeIcon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
