import 'package:flutter/material.dart';

class AuthPasswordInput extends StatefulWidget {
  const AuthPasswordInput({super.key});

  @override
  State<AuthPasswordInput> createState() => _AuthPasswordInputState();
}

class _AuthPasswordInputState extends State<AuthPasswordInput> {
  var _passwordObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordObscure = !_passwordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            hintText: "Enter your password",
            suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: Icon(
                _passwordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          obscureText: _passwordObscure,
          keyboardType: TextInputType.text,
          validator: (password) {
            if (password == null || password.trim().isEmpty) {
              return "Please enter a password";
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your password needs to:",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_outlined),
                            Text(
                              "include both lower and upper case characters",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Text("Your password needs to: "),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
