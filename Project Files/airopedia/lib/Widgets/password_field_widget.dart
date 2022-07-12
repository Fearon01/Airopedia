import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final passwordController = TextEditingController();
  final text;

  PasswordField({Key? key, required String this.text}) : super(key: key);

  TextEditingController get controller {
    return passwordController;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 75.0),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(0xfff7f3e8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: TextFormField(
              controller: passwordController,
              maxLength: 24,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) => password != null && password.length < 8
                  ? 'Enter a Minimum of 8 Characters'
                  : null,
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
