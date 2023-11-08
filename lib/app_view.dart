
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/blocs/auth_bloc/authentication_bloc.dart';
import 'package:login_flutter/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:login_flutter/screens/auth/welcome_screen.dart';
import 'package:login_flutter/screens/home/home_screen.dart';



class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			title: 'Firebase Auth',
			theme: ThemeData(
				colorScheme: const ColorScheme.light(
          background: Color.fromARGB(255, 255, 255, 255),
          onBackground: Colors.black,
          primary: Color.fromRGBO(155, 203, 226, 1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
					tertiary: Color.fromRGBO(128, 255, 223, 1),
          error: Colors.red,
					outline: Color(0xFF424242)
        ),
			),
				home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
				builder: (context, state) {
					if(state.status == AuthenticationStatus.authenticated) {
						return BlocProvider(
							create: (context) => SignInBloc(
								userRepository: context.read<AuthenticationBloc>().userRepository
							),
							child: const HomeScreen(),
						);
					} else {
						return const WelcomeScreen();
					}
				}
			)
		);
  }
}