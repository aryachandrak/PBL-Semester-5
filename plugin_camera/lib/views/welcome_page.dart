import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:plugin_camera/views/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(200, 113, 251, 241),

              // Colors.white
              Color(0xFFDFE9EB), // Mystic
              Color(0xFF61828A), // Jungle
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
              Text("Smart Acne Detection App",
                style: GoogleFonts.lexend(
                  color: const Color(0xFF61828A) ,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
              ),),
              const SizedBox(height: 10),
              Text(
                "Welcome GlowBies!",
                style: GoogleFonts.lexend(
                    color: const Color(0xFF0C243C),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Let's Find, Treat, and Love Your Skin Again",
                style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Expanded(
                child: Image(
                  image: AssetImage('assets/logo2.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signIn'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    side: const BorderSide(color: Colors.black, width: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "SIGN IN",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/getStarted'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    side: const BorderSide(color: Colors.black, width: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
    );
  }
}

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//             Color.fromARGB(200, 113, 251, 241),
//             Colors.white
//           ])
//         ),
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 50.0),
//               child: Image(image: AssetImage('assets/logo2.png'),),
//             ),
//             const SizedBox(height: 20,),
//             Text('Welcome Glowbies',
//             style: GoogleFonts.montserrat(
//               color: Colors.black,
//               fontSize: 30,
//               fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 40,),
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()));
//               },
//               child: Container(
//                 height: 50,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(child: Text('SIGN IN',
//                 style: GoogleFonts.montserrat(color:
//                   Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),),),
//               ),
//             ),
//             const SizedBox(height: 20,),
//             Container(
//               height: 50,
//               width: 300,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Center(child: Text('SIGN UP',
//               style: GoogleFonts.montserrat(color:
//                 Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),),),
//             ),

//             const Spacer(),
//             const SizedBox(width: 20),
//             Text('- Login with Sosial Media -',
//             style: GoogleFonts.montserrat(color:
//                 Colors.black,
//                 fontSize: 17,),
//             ),

//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF3b5998),),
//                   onPressed: () {
//                     // Aksi ketika ikon Facebook ditekan
//                   },
//                 ),
//                 const SizedBox(width: 20),
//                 IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFC13584),),
//                   onPressed: () {
//                     // Aksi ketika ikon Instagram ditekan
//                   },
//                 ),
//                 const SizedBox(width: 20),
//                 IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.twitter, color: Color(0xFF1da1f2),),
//                   onPressed: () {
//                     // Aksi ketika ikon Twitter ditekan
//                   },
//                 ),
//               ],
//             ),
//             const Spacer(),
//           ],
//         ),
//     ),
//     );
//   }

// }
