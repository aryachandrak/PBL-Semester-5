import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslationService {
  static const _apiKey = 'AIzaSyAAh8cc6F551eThQ8vj942leUxSdVfGR6E';
  static const _baseUrl = 'https://translation.googleapis.com/language/translate/v2';

  Future<String> translateText(String text, String targetLanguage) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        body: {
          'q': text,
          'target': targetLanguage.toLowerCase(),
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final translations = data['data']['translations'] as List;
        if (translations.isNotEmpty) {
          return translations.first['translatedText'] as String;
        }
      }
      
      print('Translation error: ${response.statusCode} - ${response.body}');
      return text;
    } catch (e) {
      print('Translation error: $e');
      return text;
    }
  }

  // Helper method to detect language
  Future<String> detectLanguage(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/detect?key=$_apiKey'),
        body: {
          'q': text,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final detections = data['data']['detections'] as List;
        if (detections.isNotEmpty && (detections.first as List).isNotEmpty) {
          return (detections.first as List).first['language'] as String;
        }
      }
      
      return 'en'; // Default to English if detection fails
    } catch (e) {
      print('Language detection error: $e');
      return 'en';
    }
  }

  // Add method to check if translation is available
  Future<bool> isTranslationAvailable() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/languages?key=$_apiKey&target=en'),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Translation availability check error: $e');
      return false;
    }
  }
}