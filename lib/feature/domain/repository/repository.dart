import 'package:book_app/core/exception/failure.dart';
import 'package:book_app/feature/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();

  Future<Either<Failure, Books>> getFictions();
  Future<Either<Failure, Books>> getNovels();
  Future<Either<Failure, Books>> getHorrors();
  Future<Either<Failure, Books>> getActions();
  Future<Either<Failure, Items>> getDetails(String id);
}