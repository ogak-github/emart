import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends HookConsumerWidget {
  final TextEditingController usernameCtrl, passwordCtrl;
  final GlobalKey<FormState>? formKey;
  const LoginForm(
      {super.key,
      required this.usernameCtrl,
      required this.passwordCtrl,
      this.formKey});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? formValidation(String? value) {
      if (value!.isEmpty) {
        return "Required";
      }
      return null;
    }

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              validator: formValidation,
              controller: usernameCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              validator: formValidation,
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
        ],
      ),
    );
  }
}
