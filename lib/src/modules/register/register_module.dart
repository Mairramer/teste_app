import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/src/modules/home/home_page.dart';

import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => RegisterController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/register', child: (_, args) => RegisterPage()),
    ChildRoute('/home', child: (_, args) => HomePage())
  ];
}
