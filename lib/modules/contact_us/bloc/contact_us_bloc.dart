import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_with_validation/network/api_source.dart';
import 'package:form_with_validation/utils/use_form.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> with UseForm {
  ContactUsBloc() : super(ContactUsState._()) {
    on<ChangeInput>(_onChangeInput);
    on<SubmitFormHandler>(_onSubmitFormHandler);
    on<ResetMessage>(_onResetMessage);
  }

  final api = ApiSource();

  _onChangeInput(ChangeInput event, Emitter<ContactUsState> emit) {
    if (state.isValidateOnSubmit) {
      var temp = Map<String, Map<String, dynamic>>.from(state.formData);
      temp[event.name]?['isValid'] = event.isValid;
      temp[event.name]?['value'] = event.value;

      emit(state.copyWith(formData: temp, isButtonActive: checkFormValidity(temp)));
    }
  }

  _onSubmitFormHandler(SubmitFormHandler event, Emitter<ContactUsState> emit) async {
    emit(state.copyWith(isValidateOnSubmit: false, isButtonActive: false, buttonText: 'Sending'));
    var data = prepareData(state.formData);

    try {
      var response = await api.contactUsRequest(data);
      if (response.statusCode == 201) {
        var temp = Map<String, Map<String, dynamic>>.from(state.formData);
        var emptyFormData = resetForm(temp);

        emit(state.copyWith(
            formData: emptyFormData,
            buttonText: 'Send',
            responseMessage: 'Success!',
            isValidateOnSubmit: true));
      } else {
        throw Error();
      }
    } catch (e) {
      emit(
        state.copyWith(
            isValidateOnSubmit: true,
            responseMessage: 'Something went wrong',
            isButtonActive: true,
            buttonText: 'Send'),
      );
    }
  }

  _onResetMessage(ResetMessage event, Emitter<ContactUsState> emit) {
    emit(state.copyWith(responseMessage: ''));
  }
}
