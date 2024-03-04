import 'package:bloc_implementation/bloc/auth_bloc.dart';
import 'package:bloc_implementation/login_screen.dart';
import 'package:bloc_implementation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            return Center(
              child: Column(
                children: [
                  Center(
                    child: Text(state.uid),
                  ),
                  GradientButton(onpressed: () {
                    context.read<AuthBloc>().add(AuthLogoutRequested());
                  }),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Login Failed!"),
            );
          }
        },
      ),
    );
  }
}




 // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home'),
    //   ),
    //   body: Center(
    //     child: BlocBuilder<AuthBloc, AuthState>(
    //       builder: (context, state) {
    //         if (state is AuthSuccess) {
    //           return Text(state.uid);
    //         } else {
    //           return CircularProgressIndicator();
    //         }
    //       },
    //     ),
    //   ),
    // );