import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:three_thousand_words/app/modules/auth/login/data/datasource/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserCredential> googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar login com o google');
  }

  @override
  Future<void> googleLogout() async {
    await GoogleSignIn().signIn();
    FirebaseAuth.instance.signOut();
  }
}
