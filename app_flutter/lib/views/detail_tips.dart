import 'package:flutter/material.dart';
import 'package:plugin_camera/views/tips_page.dart';
import 'package:provider/provider.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../provider/tips_page_provider.dart'; // Pastikan ini mengimpor provider yang sesuai

class DetailTips extends StatelessWidget {
  const DetailTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Mengambil data dari provider untuk menentukan informasi detail
    TipsPageProvider tipsPageProvider = Provider.of<TipsPageProvider>(context);
    String title = '';
    String subTitle = '';
    String image = '';

    switch (tipsPageProvider.currentIndex) {
      case 0:
        title = 'Jerawat Blackhead';
        subTitle = 'Penjelasan tentang jerawat blackhead.';
        image = 'assets/images/blacheads.jpg';
        break;
      case 1:
        title = 'Jerawat Whitehead';
        subTitle = 'Penjelasan tentang jerawat whitehead.';
        image = 'assets/images/whiteheads.jpg';
        break;
      case 2:
        title = 'Jerawat Papula';
        subTitle = 'Penjelasan tentang jerawat papula.';
        image = 'assets/images/papula.jpg';
        break;
      case 3:
        title = 'Jerawat Pustula';
        subTitle = 'Penjelasan tentang jerawat pustula.';
        image = 'assets/images/pustula.jpg';
        break;
      case 4:
        title = 'Jerawat Kistik';
        subTitle = 'Penjelasan tentang jerawat kistik.';
        image = 'assets/images/kistik.jpg';
        break;
      default:
        title = 'Detail Tips';
        subTitle = 'Informasi umum tentang tips perawatan kulit.';
        image = 'assets/images/default.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Color(0xFF6DA06F),
        automaticallyImplyLeading: false,
        toolbarHeight: 55,
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: screenHeight * 0.03),
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.05,
                top: screenHeight * 0.02,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true,
        isAlwaysShown: true,
        style: const VsScrollbarStyle(
          color: Color(0xff9D9F9F),
          hoverThickness: 1,
          radius: Radius.circular(5),
          thickness: 7,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.04,
          ),
          children: [
            Hero(
              tag: title, // Menggunakan tag yang sesuai agar animasi hero berjalan mulus
              child: Container(
                margin: EdgeInsets.only(
                  bottom: screenHeight * 0.03,
                ),
                height: screenHeight * 0.25,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

