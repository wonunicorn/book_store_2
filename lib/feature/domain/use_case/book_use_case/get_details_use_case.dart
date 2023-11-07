import 'package:book_app/core/exception/failure.dart';
import 'package:book_app/feature/domain/entities/book/book_model.dart';
import 'package:book_app/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';


class GetDetailsUseCase{
  final Repository domainRepository;

  GetDetailsUseCase(this.domainRepository);

  Future<Either<Failure, Items>> call(String id) async {
    return domainRepository.getDetails(id);
  }
}