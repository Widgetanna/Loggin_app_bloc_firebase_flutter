
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/app.dart';
import 'package:user_repository/user_repository.dart';

import 'simple_bloc_observer.dart';

void main() async {
//garanti que les liaisons Flutter sont initialisées avant de commencer l'application. 
//Cela est nécessaire pour s'assurer que Firebase fonctionne correctement.
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
	Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
