import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailWidget extends StatelessWidget {
  final emailController = TextEditingController();

  EmailWidget({Key? key}) : super(key: key);

  TextEditingController get controller {
    return emailController;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 75.0),
            child: Text(
              'Email Address',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(0xfff7f3e8),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (emailText) =>
                  emailText != null && !EmailValidator.validate(emailText)
                      ? 'Enter a valid email'
                      : null,
              maxLength: 320,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: Color(0xfff7f3e8),
              ),
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                counterText: '',
                // Normal border colour when input is enabled
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff7f3e8)),
                ),
                // Border colour when TextField is selected
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff7f3e8)),
                ),
              ),
            ),
          ),
        ],
      );
}
