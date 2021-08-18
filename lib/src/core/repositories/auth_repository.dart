import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teste_vollup/src/core/auth/auth_controller.dart';
import 'package:teste_vollup/src/core/interfaces/auth_repository_interface.dart';
import 'package:teste_vollup/src/core/shared/errors/register_interceptor.dart';
import 'package:teste_vollup/src/core/shared/responses/response_builder.dart';
import 'package:teste_vollup/src/core/shared/responses/response_default.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String? email, String? password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());

      return ResponseBuilder.success<User>(
        object: firebaseAuth.currentUser as User,
        message: 'Sucesso!',
      );
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      var googleSignIn = GoogleSignIn();

      var googleSignInAccount = await googleSignIn.signIn();

      var googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      User? firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user;
        });
      }
      return ResponseBuilder.success<User>(
          object: firebaseUser!, message: 'Logou com sucesso');
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: 'Falha ao Logar com Google. e: ${e.toString()}',
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<User>(
          object: firebaseAuth.currentUser as User, message: 'Bem Vindo');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success(message: 'Até Mais', object: null);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String? name, String? email, String? password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email!.trim(), password: password!.trim())
          .then(
        (auth) async {
          return ResponseBuilder.success<User>(
              object: auth.user as User, message: 'Successo!');
        },
      );
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }
}
