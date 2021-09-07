import 'package:mega_commons/mega_commons.dart';

class LoginProvider {
  final RestClientDio _restClientDio;

  LoginProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<AuthToken> authenticateUserByEmail(ProfileToken profileToken) async {
    final MegaResponse result = await _restClientDio.post(
      'api/v1/Profile/Token',
      data: {
        'email': profileToken.email,
        'password': profileToken.password,
      },
    );
    return AuthToken.fromJson(result.data);
  }
}
