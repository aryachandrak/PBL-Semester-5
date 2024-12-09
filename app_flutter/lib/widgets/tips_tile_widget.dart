import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tips_page_provider.dart';

class TipsTileWidget extends StatelessWidget {
  const TipsTileWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  final int id;
  final String image;
  final String title;
  final String subTitle;

  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Provider.of<TipsPageProvider>(context, listen: false).setCurrentIndex(id);
      },
      child: Hero(
        tag: id,
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.14,
          margin: EdgeInsets.only(
            top: screenHeight * 0.01,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            bottom: screenHeight * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.25),
                offset: const Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Bagian gambar
              Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              // Bagian teks (judul dan subjudul)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: subTitle,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '..more',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: const Color(0xFF1976D2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

