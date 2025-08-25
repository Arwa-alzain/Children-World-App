import 'package:educational_for_children/controller/auth/login_controller.dart';
import 'package:educational_for_children/controller/favorite/favorite_controller.dart';
import 'package:educational_for_children/view/auth/signup_view.dart';
import 'package:educational_for_children/view/first/first_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(), child: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailConroller = TextEditingController();
  final passwordConroller = TextEditingController();

  void _login() {
    context.read<LoginCubit>().loginWithEmailAndPassword(
      emailConroller.text.trim(),
      passwordConroller.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (contexr, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => Center(child: CircularProgressIndicator()),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Login Successfully!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            context.read<FavoritesCubit>().loadFavorites();
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => FirstView()));
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (_, state) {
          return Padding(
            padding: EdgeInsets.all(0),
            child: Stack(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome back to Children's world",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: emailConroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            filled: true,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor ??
                                Theme.of(context).cardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          obscureText: true,
                          controller: passwordConroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            filled: true,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor ??
                                Theme.of(context).cardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade300
                                  .withOpacity(0.8),
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: _login,
                            child: Text("Login"),
                          ),
                        ),
                        SizedBox(height: 30),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => SignupView()),
                              );
                            },
                            child: Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline, decorationColor: Colors.white
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
