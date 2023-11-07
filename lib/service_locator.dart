import 'package:book_app/feature/data/data_source/remote_data_source.dart';
import 'package:book_app/feature/data/data_source/remote_data_source_impl.dart';
import 'package:book_app/feature/data/repository/repository_impl.dart';
import 'package:book_app/feature/domain/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_it/get_it.dart';
import 'feature/domain/use_case/use_case.dart';
import 'feature/presentation/bloc/bloc.dart';

final serviceLocator = GetIt.instance;

void init(){
  
  //bloc
  serviceLocator.registerFactory<BooksBloc>(() => BooksBloc(
    serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()
  ));

  serviceLocator.registerFactory<AuthBloc>(() => AuthBloc(
    serviceLocator(), serviceLocator(), serviceLocator()
  ));
  
  //use case
  serviceLocator.registerLazySingleton<GetFictionUseCase>(() => GetFictionUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetActionUseCase>(() => GetActionUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetHorrorUseCase>(() => GetHorrorUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetNovelUseCase>(() => GetNovelUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetDetailsUseCase>(() => GetDetailsUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton<GetLoginUseCase>(() => GetLoginUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetRegisterUseCase>(() => GetRegisterUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetLogoutUseCase>(() => GetLogoutUseCase(serviceLocator()));

  //repository
  serviceLocator.registerLazySingleton<Repository>(() => RepositoryImpl(serviceLocator()));

  //data source
  serviceLocator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(serviceLocator(), serviceLocator()));

  //firebase
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  serviceLocator.registerLazySingleton(() => auth);
  serviceLocator.registerLazySingleton(() => firestore);
}

