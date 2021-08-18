import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vollup/src/core/auth/auth_controller.dart';
import 'package:teste_vollup/src/core/consts/routers_const.dart';
import 'package:teste_vollup/src/core/interfaces/auth_repository_interface.dart';
import 'package:teste_vollup/src/core/repositories/auth_repository.dart';
import 'package:teste_vollup/src/modules/home/home_page.dart';
import 'package:teste_vollup/src/modules/login/login_controller.dart';
import 'package:teste_vollup/src/modules/login/login_page.dart';
import 'package:teste_vollup/src/modules/register/register_page.dart';

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
    ChildRoute(RoutersConst.home, child: (_, __) => HomePage()),
    ChildRoute(RoutersConst.login, child: (_, __) => LoginPage()),
    ChildRoute(RoutersConst.register, child: (_, __) => RegisterPage())
  ];
}
