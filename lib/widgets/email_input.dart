import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/product/language/error_language_items.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class AuthEmailInput extends StatefulWidget {
  const AuthEmailInput({
    super.key,
    required this.onSaved,
  });

  final void Function(String) onSaved;

  @override
  State<AuthEmailInput> createState() => _AuthEmailInputState();
}

class _AuthEmailInputState extends State<AuthEmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.email_outlined,
        ),
        hintText: LanguageItems.emailInputPlaceholder,
        prefixIconColor: Color(kPrimaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email == null || email.trim().isEmpty) {
          return ErrorLanguageItems.emailIsEmpty;
        }

        if (EmailValidator.validate(email) == false) {
          return ErrorLanguageItems.emailIsInvalid;
        }

        return null;
      },
      onSaved: (value) {
        widget.onSaved(value!);
      },
    );
  }
}
