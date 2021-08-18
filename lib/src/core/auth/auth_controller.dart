import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_vollup/src/core/consts/routers_const.dart';
import 'package:teste_vollup/src/core/interfaces/auth_repository_interface.dart';
import 'package:get/get.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  late IAuthRepository authRepository;

  _AuthControllerBase() {
    authRepository = Modular.get<IAuthRepository>();
  }

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  bool get enableButton =>
      name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;

  @action
  void setName(String name) => this.name = name;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((response) {
      if (response.success) {
        verifyUser();
        Get.toNamed(RoutersConst.home);
      } else {
        print(response.message);
      }
    });
  }

  Future<void> doLoginEmail() async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((response) {
      if (response.success) {
        verifyUser();
        Get.toNamed(RoutersConst.home);
      } else {
        throw response;
      }
    });
  }

  Future<void> doRegister() async {
    var response = await authRepository.registerEmailPassword(
      name: name,
      email: email,
      password: password,
    );
    if (response.success) {
      verifyUser();
      Get.toNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }

  Future<void> doLogout() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Get.toNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }

  saveInfoFirestore() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var user = FirebaseFirestore.instance.collection('users');
    user.doc(uid).set({
      'id': uid,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'email': FirebaseAuth.instance.currentUser!.email,
      'balance': 0
    });
  }

  verifyUser() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return;
      } else {
        saveInfoFirestore();
      }
    });
  }
}
