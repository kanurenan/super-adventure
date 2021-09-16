import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons/shared/models/credit_card.dart';

class PayCardsProvider {
  final RestClientDio _restClientDio;

  PayCardsProvider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<MegaResponse> onSubmitRequest(CreditCard creditCard) async {
    final response = await _restClientDio.post(
      'api/v1/CreditCard/Register',
      data: creditCard.toJson(),
    );
    return response;
  }
}
