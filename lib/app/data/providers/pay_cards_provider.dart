import 'package:mega_commons/mega_commons.dart';

class PayCardsProvider {
  final RestClientDio _restClientDio;

  PayCardsProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<MegaResponse> onSubmitRequest() async {
    final response = await _restClientDio.get('');
    return response;
  }
}
