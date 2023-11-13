import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_with_validation/modules/contact_us/bloc/contact_us_bloc.dart';
import 'package:form_with_validation/utils/use_validation.dart';
import 'package:form_with_validation/widgets/custom_button.dart';
import 'package:form_with_validation/widgets/custom_textfield.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with UseValidation {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsBloc(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  void onFormSubmitted(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<ContactUsBloc>(context);
    final eventState = context.select((ContactUsBloc bloc) => bloc.state);
    return BlocListener<ContactUsBloc, ContactUsState>(
      listener: (context, state) {
        if (state.responseMessage != '') {
          onFormSubmitted(state.responseMessage);
          bloc.add(ResetMessage());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _TextfieldLine(
                    textfield: CustomTextfield(
                      lable: 'Name',
                      value: eventState.formData['name']?['value'],
                      onChanged: (value) {
                        bloc.add(
                            ChangeInput(name: 'name', isValid: isValueExist(value), value: value));
                      },
                      validator: (value) {
                        return requiredField(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  _TextfieldLine(
                    textfield: CustomTextfield(
                      lable: 'Email',
                      value: eventState.formData['email']?['value'],
                      onChanged: (value) {
                        bloc.add(ChangeInput(name: 'email', isValid: isEmailValid, value: value));
                      },
                      validator: (value) {
                        return validateEmail(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  _TextfieldLine(
                    textfield: CustomTextfield(
                      lable: 'Message',
                      value: eventState.formData['message']?['value'],
                      onChanged: (value) {
                        bloc.add(ChangeInput(
                            name: 'message', isValid: isValueExist(value), value: value));
                      },
                      validator: (value) {
                        return requiredField(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                      titleWidget: Text(
                        eventState.buttonText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      onPressed: eventState.isButtonActive
                          ? () {
                              bloc.add(SubmitFormHandler());
                            }
                          : null,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextfieldLine extends StatelessWidget {
  const _TextfieldLine({required this.textfield});

  final CustomTextfield textfield;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color.fromRGBO(254, 243, 227, 1),
          radius: 25,
          child: Icon(
            Icons.lock_open_sharp,
            color: Color.fromRGBO(222, 117, 126, 1),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(child: textfield),
      ],
    );
  }
}
