// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageProvider extends ChangeNotifier {
//   String _currentLanguage = 'English';
  
//   String get currentLanguage => _currentLanguage;

//   Future<void> loadSavedLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     _currentLanguage = prefs.getString('language') ?? 'English';
//     notifyListeners();
//   }

//   Future<void> setLanguage(String language) async {
//     _currentLanguage = language;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', language);
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:plugin_camera/models/translation_service.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'English';
  final TranslationService _translationService = TranslationService();
  bool _isTranslating = false;

  String get currentLanguage => _currentLanguage;
  bool get isTranslating => _isTranslating;

  Future<void> setLanguage(String language) async {
    if (_currentLanguage == language) return;

    _isTranslating = true;
    notifyListeners();

    try {
      // Check if translation service is available
      final isAvailable = await _translationService.isTranslationAvailable();
      if (!isAvailable) {
        throw Exception('Translation service is not available');
      }

      _currentLanguage = language;
    } catch (e) {
      print('Error setting language: $e');
    } finally {
      _isTranslating = false;
      notifyListeners();
    }
  }

  Future<String> translateText(String text) async {
    if (text.isEmpty) return text;
    
    try {
      // Get target language code
      final targetLang = _currentLanguage == 'English' ? 'en' : 'id';
      
      // Detect source language
      final sourceLang = await _translationService.detectLanguage(text);
      
      // Only translate if source and target languages are different
      if (sourceLang != targetLang) {
        return await _translationService.translateText(text, targetLang);
      }
      
      return text;
    } catch (e) {
      print('Translation error: $e');
      return text;
    }
  }
}