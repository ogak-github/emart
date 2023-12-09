import 'package:emart_v2/provider/auth_provider.dart';
import 'package:emart_v2/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'login_form.dart';

final usernameController =
    StateProvider.autoDispose((ref) => TextEditingController());
final passwordController =
    StateProvider.autoDispose((ref) => TextEditingController());

class LoginScreen extends ConsumerWidget {
  static const path = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final usernameCtrl = ref.watch(usernameController);
    final passwordCtrl = ref.watch(passwordController);
    final auth = ref.watch(authStateProvider);

    void login(String username, String password) {
      if (formKey.currentState!.validate()) {
        ref
            .read(authStateProvider.notifier)
            .login(username, password)
            .then((value) {
          if (value.code == 200) {
            context.go(MainScreen.path);
          } else {}
        });
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 125),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Login",
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    LoginForm(
                      usernameCtrl: usernameCtrl,
                      passwordCtrl: passwordCtrl,
                      formKey: formKey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 45,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                login(
                                  usernameCtrl.text.trim(),
                                  passwordCtrl.text.trim(),
                                );
                              },
                              child: Center(
                                child: auth.isLoading
                                    ? const Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text("Login"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 45,
                            width: 100,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Sign Up"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
