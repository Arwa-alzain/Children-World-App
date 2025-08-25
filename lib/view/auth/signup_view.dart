import 'package:educational_for_children/controller/auth/signup_controller.dart';
import 'package:educational_for_children/controller/favorite/favorite_controller.dart';
import 'package:educational_for_children/view/auth/login_view.dart';
import 'package:educational_for_children/view/first/first_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // مهم جداً

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void _signup() {
    context.read<SignupCubit>().loginWithEmailAndPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
          nameController.text.trim(),
        );
  }

  Future<void> _saveUserData(String email, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) async {
          if (state is SignupLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (state is SignupSuccess) {
            await _saveUserData(
              emailController.text.trim(),
              nameController.text.trim(),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Signup Successfully!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            context.read<FavoritesCubit>().loadFavorites();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const FirstView()),
            );
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (_, state) {
          return Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  'assets/images/background/background.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(color: Colors.black.withOpacity(0.4)),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome to Children's world",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: "Name",
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
                              Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: "Email",
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
                              Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: "Password",
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
                              Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade300.withOpacity(0.8),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          onPressed: _signup,
                          child: const Text("Signup"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const LoginView()),
                          );
                        },
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
