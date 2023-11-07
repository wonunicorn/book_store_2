import 'package:book_app/feature/presentation/bloc/bloc.dart';
import 'package:book_app/feature/presentation/screens/screens.dart';
import 'package:book_app/feature/presentation/screens/components.dart';
import 'package:book_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionBooks extends StatefulWidget {
  const ActionBooks({Key? key}) : super(key: key);
  @override
  State<ActionBooks> createState() => _ActionBooksState();
}

class _ActionBooksState extends State<ActionBooks> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BooksBloc>(
      create: (context) => serviceLocator<BooksBloc>()..add(const ActionBooksEvent()),
      child: BlocBuilder<BooksBloc, BooksState>(builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loaded: (books, items) {
            return LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: books?.items?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return BookDetailsScreen(id: "${books?.items![index].id}");
                      }));
                    },
                    child: BookCard(
                      title: "${books?.items![index].volumeInfo?.title}",
                      image: "${books?.items?[index].volumeInfo?.imageLinks?.smallThumbnail}",
                      constraints: constraints,
                      pageCount: "${books?.items![index].volumeInfo?.pageCount}",
                    ),
                  );
                },
              );
            });
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e) => const Text("Opps! Try again later!"),
        );
      }),
    );
  }
}