import 'package:book_app/core/exception/failure.dart';
import 'package:book_app/feature/domain/entities/book/book_model.dart';
import 'package:book_app/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetNovelUseCase{
  final Repository domainRepository;

  GetNovelUseCase(this.domainRepository);

  Future<Either<Failure, Books>> call() async {
    return domainRepository.getNovels();
  }
}