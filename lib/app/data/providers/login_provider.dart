import 'package:mega_commons/shared/helpers/custom_dio/rest_client_dio.dart';
import 'package:mega_commons/shared/models/models.dart';

class LoginProvider {
  final RestClientDio _restClientDio;

  LoginProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<AuthToken> authenticateUserByEmail(ProfileToken profileToken) async {
    final result = await _restClientDio.post(
      'api/v1/Profile/Token',
      data: {
        'login': 'renankanu', //profileToken.email,
        'password': profileToken.password,
      },
    );
    return AuthToken.fromJson(result.data);
  }
}
