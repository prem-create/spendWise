import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_wise/core/widgets/my_alert_dialog_widget.dart';
import 'package:spend_wise/cubits/auth/auth_cubit.dart';
import 'package:spend_wise/pages/main_screen.dart';
import 'package:spend_wise/repo/auth_repository.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),

                        // Title
                        const Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Login to continue managing your expenses",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),

                        const SizedBox(height: 40),

                        // Email
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Password
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              final TextEditingController
                              forgotPasswordEmailcontroller =
                                  TextEditingController();

                                  //context which has provider in tree 
                                  final BuildContext parentContext = context;
                              showDialog(
                                context: context,
                                builder: (_) => MyAlertDialogWidget(
                                  title: "Forgot Password??",
                                  iconData: Icons.password,
                                  content: TextField(
                                    decoration: InputDecoration(
                                      label: Text("Enter Email")
                                    ),
                                    controller: forgotPasswordEmailcontroller,
                                  ),
                                  onOk: () {
                                    parentContext.read<AuthCubit>().resetPassword(
                                      forgotPasswordEmailcontroller.text,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            child: const Text("Forgot Password?"),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().login(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Login"),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Divider
                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("OR"),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Google Login
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text("Continue with Google"),
                          ),
                        ),

                        const Spacer(),

                        // Signup
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Don't have an account? Sign up"),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  if (state is AuthLoading)
                    Center(child: const CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
