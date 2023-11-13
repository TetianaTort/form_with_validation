part of 'contact_us_bloc.dart';

class ContactUsState extends Equatable {
  final Map<String, Map<String, dynamic>> formData;
  final String buttonText;
  final bool isButtonActive;
  final bool isValidateOnSubmit;
  final String responseMessage;
  ContactUsState._({
    formData,
    buttonText,
    isButtonActive,
    isValidateOnSubmit,
    responseMessage,
  })  : formData = formData ??
            {
              'email': {'value': '', 'isValid': false},
              'name': {'value': '', 'isValid': false},
              'message': {'value': '', 'isValid': false},
            },
        buttonText = buttonText ?? 'Send',
        isButtonActive = isButtonActive ?? false,
        isValidateOnSubmit = isValidateOnSubmit ?? true,
        responseMessage = responseMessage ?? '';

  ContactUsState.initial() : this._();

  ContactUsState copyWith(
      {Map<String, Map<String, dynamic>>? formData,
      String? buttonText,
      bool? isButtonActive,
      bool? isValidateOnSubmit,
      String? responseMessage}) {
    return ContactUsState._(
        formData: formData ?? this.formData,
        buttonText: buttonText ?? this.buttonText,
        isButtonActive: isButtonActive ?? this.isButtonActive,
        isValidateOnSubmit: isValidateOnSubmit ?? this.isValidateOnSubmit,
        responseMessage: responseMessage ?? this.responseMessage);
  }

  @override
  List<Object?> get props => [
        formData,
        buttonText,
        isButtonActive,
        responseMessage,
      ];
}
