// lib/providers/coffee_image_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import '../repositories/coffee_image_repository.dart';
import '../services/coffee_image_service.dart';

class CoffeeImageProvider with ChangeNotifier {
  final CoffeeImageService _service = CoffeeImageService();
  final CoffeeImageRepository _repository = CoffeeImageRepository();

  File? _currentImage;
  bool _isLoading = false;

  File? get currentImage => _currentImage;
  bool get isLoading => _isLoading;

  Future<void> loadNewImage() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentImage = await _service.fetchCoffeeImage();
    } catch (e) {
      print('Error loading image: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveImage() async {
    if (_currentImage != null) {
      await _repository.saveCoffeeImage(_currentImage!);
      notifyListeners();
    }
  }

  Future<List<File>> getSavedImages() async {
    return await _repository.getSavedImages();
  }

  Future<void> deleteImage(String filePath) async {
    await _repository.deleteImage(filePath);
    notifyListeners();
  }
}
