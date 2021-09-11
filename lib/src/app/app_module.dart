import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/auth/auth_controller.dart';
import '../core/interfaces/auth_repository_interface.dart';
import '../core/repositories/auth_repository.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_controller.dart';
import '../modules/login/login_page.dart';
import '../modules/register/register_page.dart';

import 'app_controller.dart';

class AppModule extends Module {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        // Repositories
        // Bind<ISharedPrederenceInterface>(
        //   (i) => SharedRepository(),
        // ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        // Controllers
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => AuthController(),
        ),
        Bind(
          (i) => LoginController(),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/login', child: (_, __) => LoginPage()),
    ChildRoute('/register', child: (_, __) => RegisterPage())
  ];
}
