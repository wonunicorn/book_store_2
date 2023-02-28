import 'package:book_app/core/exception/failure.dart';
import 'package:book_app/feature/domain/entities/book_model.dart';
import 'package:book_app/feature/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';

class GetActionUseCase{
  final BookRepository domainRepository;

  GetActionUseCase(this.domainRepository);

  Future<Either<Failure, Books>> call() async {
    return domainRepository.getActions();
  }
}