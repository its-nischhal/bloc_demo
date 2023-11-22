import 'package:bloc_demo/src/bloc/home/home_bloc.dart';
import 'package:bloc_demo/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:bloc_demo/src/bloc/sign_in/sign_in_event.dart';
import 'package:bloc_demo/src/bloc/sign_in/sign_in_state.dart';
import 'package:bloc_demo/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:bloc_demo/src/screens/auth/sign_up_screen.dart';
import 'package:bloc_demo/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController userNameController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInScreenBloc, SignInScreenState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => HomeScreenBloc(),
                  child: const HomeScreen(),
                ),
              ));
        }
        if (state is SignInLoadingState) {}
        if (state is SignInFailureState) {}
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              ElevatedButton(
                  onPressed: () => context.read<SignInScreenBloc>().add(
                      SignInEvent(
                          passwordController.text, userNameController.text)),
                  child: const Text('Sign In')),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => SignUpScreenBloc(),
                          child: SignUpScreen(),
                        ),
                      )),
                  child: const Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}
