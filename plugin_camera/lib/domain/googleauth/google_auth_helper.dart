import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  Future<GoogleSignInAccount?> googleSignInProcess() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      return googleUser;
    }
    return null;
  }

  alreadySignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    bool alreadySignIn = await googleSignIn.isSignedIn();
    return alreadySignIn;
  }

  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signOut();
    return googleUser;
  }
}
