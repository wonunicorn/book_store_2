import 'package:book_app/feature/data/data_source/book_remote_data_source.dart';
import 'package:book_app/feature/data/data_source/book_remote_data_source_impl.dart';
import 'package:book_app/feature/data/repository/books_repository_impl.dart';
import 'package:book_app/feature/domain/repository/book_repository.dart';
import 'package:book_app/feature/domain/use_case/get_action_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_details_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_fictions_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_novels_use_case.dart';
import 'package:book_app/feature/presentation/bloc/books/books_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/domain/use_case/get_horros_use_case.dart';

final serviceLocator = GetIt.instance;

void init(){
  
  //bloc
  serviceLocator.registerFactory<BooksBloc>(() => BooksBloc(
    serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()
  ));
  
  //use case
  serviceLocator.registerLazySingleton<GetFictionUseCase>(() => GetFictionUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetActionUseCase>(() => GetActionUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetHorrorUseCase>(() => GetHorrorUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetNovelUseCase>(() => GetNovelUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetDetailsUseCase>(() => GetDetailsUseCase(serviceLocator()));

  //repository
  serviceLocator.registerLazySingleton<BookRepository>(() => BooksRepositoryImpl(serviceLocator()));

  //data source
  serviceLocator.registerLazySingleton<BookRemoteDataSource>(() => BookRemoteDataSourceImpl());
}
