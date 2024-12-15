// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:plugin_camera/provider/language_provider.dart';
// import 'package:plugin_camera/widgets/theme.dart';

// class AppLanguagePage extends StatefulWidget {
//   const AppLanguagePage({super.key});

//   @override
//   State<AppLanguagePage> createState() => AppLanguagePageState();
// }

// class AppLanguagePageState extends State<AppLanguagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LanguageProvider>(
//       builder: (context, languageProvider, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('App Language', style: medium18.copyWith(color: Colors.black)),
//             centerTitle: true,
//           ),
//           body: Column(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.language),
//                 title: const Text('English'),
//                 trailing: Radio<String>(
//                   value: 'English',
//                   groupValue: languageProvider.currentLanguage,
//                   onChanged: (String? value) {
//                     languageProvider.setLanguage(value!);
//                   },
//                   activeColor: const Color(0xFF6DA06F),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.language),
//                 title: const Text('Indonesia'),
//                 trailing: Radio<String>(
//                   value: 'Indonesia',
//                   groupValue: languageProvider.currentLanguage,
//                   onChanged: (String? value) {
//                     languageProvider.setLanguage(value!);
//                   },
//                   activeColor: const Color(0xFF6DA06F),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF6DA06F),
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Save Changes',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plugin_camera/provider/language_provider.dart';
import 'package:plugin_camera/widgets/theme.dart';

class AppLanguagePage extends StatefulWidget {
  const AppLanguagePage({super.key});

  @override
  State<AppLanguagePage> createState() => AppLanguagePageState();
}

class AppLanguagePageState extends State<AppLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('App Language', style: medium18.copyWith(color: Colors.black)),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('English'),
                    trailing: Radio<String>(
                      value: 'English',
                      groupValue: languageProvider.currentLanguage,
                      onChanged: languageProvider.isTranslating
                          ? null
                          : (String? value) {
                              languageProvider.setLanguage(value!);
                            },
                      activeColor: const Color(0xFF6DA06F),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Indonesia'),
                    trailing: Radio<String>(
                      value: 'Indonesia',
                      groupValue: languageProvider.currentLanguage,
                      onChanged: languageProvider.isTranslating
                          ? null
                          : (String? value) {
                              languageProvider.setLanguage(value!);
                            },
                      activeColor: const Color(0xFF6DA06F),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: languageProvider.isTranslating
                          ? null
                          : () {
                              Navigator.pop(context);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6DA06F),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (languageProvider.isTranslating)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6DA06F)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}