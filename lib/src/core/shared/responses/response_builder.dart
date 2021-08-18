import '../enums/app_enums.dart';
import '../errors/register_interceptor.dart';

import 'response_default.dart';

class ResponseBuilder {
  static DefaultResponse failed<T>(
      {required T object,
      required String message,
      RegisterErrorInterceptor? errorInterceptor}) {
    return DefaultResponse<T>(object,
        objectResponse: object,
        message: message,
        status: ResponseStatus.Failed);
  }

  static DefaultResponse success<T>(
      {required T object, required String message}) {
    return DefaultResponse<T>(object,
        objectResponse: object,
        message: message,
        status: ResponseStatus.Success);
  }
}
