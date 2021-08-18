import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vollup/src/core/auth/auth_controller.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => LoginController(),
        ),
        Bind(
          (i) => AuthController(),
        )
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage())
  ];
}
