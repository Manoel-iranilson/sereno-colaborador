// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camera/camera.dart';
import 'dart:convert';

class CameraPhoto extends StatefulWidget {
  const CameraPhoto({
    super.key,
    this.width,
    this.height,
    this.tirarfoto,
    this.defaultCameraPosition = 'front', // Novo parâmetro para posição padrão
  });

  final double? width;
  final double? height;
  final Future Function()? tirarfoto;
  final String defaultCameraPosition; // 'front' ou 'back'

  @override
  State<CameraPhoto> createState() => _CameraPhotoState();
}

class _CameraPhotoState extends State<CameraPhoto> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isLoading = false;
  int _currentCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameras = cameras;

        // Seleciona a câmera inicial baseada no parâmetro defaultCameraPosition
        if (widget.defaultCameraPosition == 'back') {
          _currentCameraIndex = cameras.indexWhere(
            (camera) => camera.lensDirection == CameraLensDirection.back,
          );
          if (_currentCameraIndex == -1) _currentCameraIndex = 0;
        } else {
          _currentCameraIndex = cameras.indexWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
          );
          if (_currentCameraIndex == -1) _currentCameraIndex = 0;
        }

        await _setupController();
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _setupController() async {
    if (_cameras == null || _cameras!.isEmpty) return;

    try {
      await _controller?.dispose();

      _controller = CameraController(
          _cameras![_currentCameraIndex], ResolutionPreset.max);

      await _controller!.initialize();

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      print('Error setting up controller: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras == null || _cameras!.length <= 1) return;

    setState(() {
      _isCameraInitialized = false;
    });

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras!.length;
    await _setupController();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final file = await _controller!.takePicture();
      final fileAsBytes = await file.readAsBytes();
      final base64 = base64Encode(fileAsBytes);

      setState(() {
        FFAppState().fileBase64 = base64;
        FFAppState().makePhoto = false;
      });

      if (widget.tirarfoto != null) {
        await widget.tirarfoto!();
      }
    } catch (e) {
      print('Error taking picture: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized || _controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        // Preview da câmera
        Positioned.fill(
          child: CameraPreview(_controller!),
        ),

        // Botão de rotação da câmera (canto superior direito)
        Positioned(
          top: 50,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: _cameras != null && _cameras!.length > 1
                  ? _switchCamera
                  : null,
              icon: const Icon(
                Icons.flip_camera_ios,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _isLoading ? null : _takePicture,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF06475a),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF06475a),
                          ),
                          strokeWidth: 4,
                        ),
                      )
                    : const Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Color(0xFF06475a),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
