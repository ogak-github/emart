import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/login/data/state/auth_state.dart';
import 'package:emart/src/login/screen/login_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../routes/app_routes.dart';
import '../data/model/login.dart' as credential;

final usernameController =
    StateProvider.autoDispose((ref) => TextEditingController());
final passwordController =
    StateProvider.autoDispose((ref) => TextEditingController());

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final usernameCtrl = ref.watch(usernameController);
    final passwordCtrl = ref.watch(passwordController);
    final auth = ref.watch(authStateProvider);

    void authenticate() async {
      final saveLogin = ref.read(prefsClientProvider);
      final login = await ref.read(authStateProvider.notifier).login(
            credential.Login(
              username: usernameCtrl.text,
              password: passwordCtrl.text,
            ),
          );
      if (login.code == 200 && login.token.isNotEmpty) {
        await saveLogin.saveIsLogin(true);
        ref.invalidate(routerProvider);
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                        if (formKey.currentState!.validate()) {
                          authenticate();
                        }
                      },
                      child: Center(
                        child: auth.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
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
    );
  }
}
