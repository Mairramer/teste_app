import 'package:teste_vollup/src/core/shared/enums/app_enums.dart';

class DefaultResponse<T> {
  late final T object;

  final String message;

  ResponseStatus status;

  var objectResponse;

  bool get success => status == ResponseStatus.Success;
  bool get failed => status == ResponseStatus.Failed;

  // ignore: public_member_api_docs
  DefaultResponse(object,
      {required this.objectResponse,
      required this.message,
      required this.status});
}
