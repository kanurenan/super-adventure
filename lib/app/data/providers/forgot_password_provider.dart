import 'package:mega_commons/mega_commons.dart';

class ForgotPasswordProvider {
  final RestClientDio _restClientDio;

  ForgotPasswordProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<MegaResponse> onSubmitRequest(String email) async {
    final response = await _restClientDio.post(
      'api/v1/Profile/ForgotPassword',
      data: {
        'email': email,
      },
    );
    return response;
  }
}
