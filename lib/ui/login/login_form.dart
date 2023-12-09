import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibility = StateProvider((ref) => true);

class LoginForm extends ConsumerWidget {
  final TextEditingController usernameCtrl, passwordCtrl;
  final GlobalKey<FormState>? formKey;
  const LoginForm(
      {super.key,
      required this.usernameCtrl,
      required this.passwordCtrl,
      this.formKey});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(passwordVisibility);
    String? formValidation(String? value) {
      if (value!.isEmpty) {
        return "Required";
      }
      return null;
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              validator: formValidation,
              controller: usernameCtrl,
              decoration: const InputDecoration(
                //border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              validator: formValidation,
              controller: passwordCtrl,
              obscureText: obscureText,
              decoration: InputDecoration(
                //border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(passwordVisibility.notifier)
                        .update((state) => !obscureText);
                  },
                  icon: obscureText
                      ? const Icon(Icons.abc)
                      : const Icon(Icons.password),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
