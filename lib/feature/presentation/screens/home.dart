import 'package:book_app/feature/presentation/screens/books_screen/action_book_screen.dart';
import 'package:book_app/feature/presentation/screens/books_screen/fiction_book_screen.dart';
import 'package:book_app/feature/presentation/screens/books_screen/horror_book_screen.dart';
import 'package:book_app/feature/presentation/screens/books_screen/novel_book_screen.dart';
import 'package:book_app/feature/presentation/screens/components/book_title.dart';
import 'package:book_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Books",
          style: TextStyle(
            color: kdarkblue,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app, size: 25,
              color: kdarkblue,
            ),
            onPressed: () {
              //context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const BookTitle(type: "Adventure Books"),
              SizedBox( height: MediaQuery.of(context).size.height / 3,child: const ActionBooks()),
              const BookTitle(type: "Novel Books"),
              SizedBox( height: MediaQuery.of(context).size.height / 3,child: const NovelBooks()),
              const BookTitle(type: "Fiction Books"),
              SizedBox( height: MediaQuery.of(context).size.height / 3,child: const FictionBooks()),
              const BookTitle(type: "Horror Books"),
              SizedBox( height: MediaQuery.of(context).size.height / 3,child: const HorrorBooks()),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}