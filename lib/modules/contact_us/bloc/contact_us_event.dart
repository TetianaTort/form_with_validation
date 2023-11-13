part of 'contact_us_bloc.dart';

sealed class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeInput extends ContactUsEvent {
  final String name;
  final String? value;
  final bool isValid;

  const ChangeInput({
    required this.value,
    required this.name,
    required this.isValid,
  });
  @override
  List<Object?> get props => [name, value, isValid];
}

final class SubmitFormHandler extends ContactUsEvent {}

final class ResetMessage extends ContactUsEvent {}
