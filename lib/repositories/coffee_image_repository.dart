// lib/repositories/coffee_image_repository.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CoffeeImageRepository {
  Future<void> saveCoffeeImage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final String timestamp = DateTime.now().toIso8601String();
    final savedFile = File('${directory.path}/coffee_image_$timestamp.jpg');
    await imageFile.copy(savedFile.path);
  }

  Future<List<File>> getSavedImages() async {
    final directory = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files = directory.listSync();
    return files.whereType<File>().toList();
  }

  Future<void> deleteImage(String filePath) async {
    final file = File(filePath);
    await file.delete();
  }
}
