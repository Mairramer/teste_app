import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:teste_vollup/src/core/consts/routers_const.dart';

class LoginController {
  void doRegister() {
    Get.toNamed(RoutersConst.register);
  }
}
