import 'package:book_app/core/exception/failure.dart';
import 'package:book_app/feature/domain/entities/book_model.dart';
import 'package:book_app/feature/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';


class GetDetailsUseCase{
  final BookRepository domainRepository;

  GetDetailsUseCase(this.domainRepository);

  Future<Either<Failure, Items>> call(String id) async {
    return domainRepository.getDetails(id);
  }
}