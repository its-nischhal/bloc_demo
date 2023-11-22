import 'package:bloc_demo/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:bloc_demo/src/bloc/sign_in/sign_in_state.dart';
import 'package:bloc_demo/src/bloc/sign_up/sign_up_event.dart';
import 'package:bloc_demo/src/bloc/sign_up/sign_up_state.dart';
import 'package:bloc_demo/src/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sign_up/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController userNameController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpScreenBloc, SignUpScreenState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.pop(context);
        }
        if (state is SignUpLoadingState) {}
        if (state is SignUpFailureState) {}
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
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              ElevatedButton(
                  onPressed: () => context.read<SignUpScreenBloc>().add(
                      SignUpEvent(SignUpModel(userNameController.text,
                          passwordController.text, nameController.text))),
                  child: const Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}
