import 'package:flutter/material.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons_dependencies/mega_commons_dependencies.dart';

import '../controllers/pay_cards_controller.dart';

class PayCardView extends GetView<PayCardsController> {
  const PayCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartões'),
      ),
      body: Obx(
        () => Column(
          children: [
            CreditCardWidget(
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              cardHolderName: controller.cardHolderName.value,
              cardNumber: controller.cardNumber.value,
              cvvCode: controller.cvvCode.value,
              showBackView: controller.isCvvFocused.value,
              expiryDate: controller.expiryDate.value,
              height: 175,
              cardBgColor: Get.theme.primaryColor,
              textStyle: TextStyle(color: Get.theme.canvasColor),
              textStyleCvv: TextStyle(color: Get.theme.errorColor),
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 1000),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            MegaTextFieldWidget(
                              controller.numberController,
                              labelText: 'Número',
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(controller.expiryDateNode);
                              },
                              onChanged: (text) {
                                controller.cardNumber.value = text!;
                              },
                              textInputAction: TextInputAction.next,
                              autofillHints: const <String>[
                                AutofillHints.creditCardNumber
                              ],
                              keyboardType: TextInputType.number,
                              validator: (String? value) {
                                if (value!.isEmpty || value.length < 16) {
                                  return 'Por favor insira um número válido';
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MegaTextFieldWidget(
                                    controller.expiryDateController,
                                    labelText: 'Data',
                                    focusNode: controller.expiryDateNode,
                                    onEditingComplete: () {
                                      FocusScope.of(context).requestFocus(
                                          controller.cvvFocusNode);
                                    },
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    autofillHints: const <String>[
                                      AutofillHints.creditCardExpirationDate
                                    ],
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor insira uma data válida';
                                      }
                                      final DateTime now = DateTime.now();
                                      final List<String> date =
                                          value.split(RegExp('/'));
                                      final int month = int.parse(date.first);
                                      final int year =
                                          int.parse('20${date.last}');
                                      final DateTime cardDate =
                                          DateTime(year, month);

                                      if (cardDate.isBefore(now) ||
                                          month > 12 ||
                                          month == 0) {
                                        return 'Por favor insira uma data válida';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Expanded(
                                  child: MegaTextFieldWidget(
                                    controller.cvvController,
                                    focusNode: controller.cvvFocusNode,
                                    onEditingComplete: () {
                                      FocusScope.of(context).requestFocus(
                                          controller.cardHolderNode);
                                    },
                                    labelText: 'CVV',
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    autofillHints: const <String>[
                                      AutofillHints.creditCardSecurityCode
                                    ],
                                    onChanged: (text) {
                                      controller.cvvCode.value = text!;
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty || value.length < 3) {
                                        return 'Por favor insira um CVV válido';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                            MegaTextFieldWidget(
                              controller.nameController,
                              focusNode: controller.cardHolderNode,
                              labelText: 'Nome',
                              autofillHints: const <String>[
                                AutofillHints.creditCardName
                              ],
                              validator: (String? value) {
                                if (value!.split(' ').length < 2 ||
                                    value.split(' ')[1].trim().isEmpty) {
                                  return 'Informe um nome correto';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: MegaBaseButton(
                        'Cadastrar Cartão',
                        onButtonPress: () async {
                          controller.onSubmit();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
