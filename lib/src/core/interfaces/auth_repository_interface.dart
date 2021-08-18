import 'package:teste_vollup/src/core/shared/responses/response_default.dart';

abstract class IAuthRepository {
  // ignore: public_member_api_docs
  Future<DefaultResponse> doLoginGoogle();
  // ignore: public_member_api_docs
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  // ignore: public_member_api_docs
  Future<DefaultResponse> registerEmailPassword(
      {String name, String email, String password});
  // ignore: public_member_api_docs
  Future<DefaultResponse> getUser();
  // ignore: public_member_api_docs
  Future<DefaultResponse> logOut();
}
