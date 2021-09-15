import 'package:mega_commons/mega_commons.dart';

class ChangePasswordProvider {
  final RestClientDio _restClientDio;

  ChangePasswordProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<MegaResponse> onSubmitRequest(
      ChangePasswordParams changePasswordParams) async {
    final response = await _restClientDio.post(
      'api/v1/Profile/ChangePassword',
      data: {
        'currentPassword': changePasswordParams.currentPassword,
        'newPassword': changePasswordParams.newPassword,
      },
    );
    return response;
  }
}

class ChangePasswordParams {
  final String currentPassword;
  final String newPassword;

  ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });
}
