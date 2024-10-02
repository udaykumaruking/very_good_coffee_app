// lib/services/coffee_image_service.dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class CoffeeImageService {
  Future<File> fetchCoffeeImage() async {
    try {
      final response = await http.get(Uri.parse(AppConstants.coffeeApiUrl));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final String timestamp =
            DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
        final file =
            File('${directory.path}/current_coffee_image_$timestamp.jpg');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        throw HttpException('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching the coffee image: $e');
    }
  }
}
