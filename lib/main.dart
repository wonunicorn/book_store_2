import 'package:book_app/feature/presentation/bloc/books/books_bloc.dart';
import 'package:book_app/feature/presentation/screens/home.dart';
import 'package:book_app/service_locator.dart' as sl;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.serviceLocator<BooksBloc>()),
      ],
      child: const MaterialApp(
        title: 'Book App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

