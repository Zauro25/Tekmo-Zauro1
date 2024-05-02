import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _repasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/diamond.png'),
        title: const Text("SHRINE"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/diamond.png'),
                    Text(
                      "Register",
                      style: textStyle.displayMedium,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      style: textStyle.labelLarge,
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
              const Text("Masukkan Nama User"),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration().copyWith(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Masukkan Password"),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration().copyWith(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Masukkan Ulang Password"),
              TextField(
                controller: _repasswordController,
                decoration: const InputDecoration().copyWith(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _usernameController.clear();
                      _repasswordController.clear();
                      _passwordController.clear();
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Register"),
                  )
                ],
              ),
              const SizedBox(height: 250),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Sudah punya akun? ",
                      style: textStyle.bodyMedium,
                    ),
                    TextSpan(
                      text: "Sign In",
                      style: textStyle.bodyMedium?.copyWith(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
