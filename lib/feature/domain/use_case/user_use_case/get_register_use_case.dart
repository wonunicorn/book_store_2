import 'package:book_app/feature/domain/repository/repository.dart';

class GetRegisterUseCase{
  final Repository domainRepository;

  GetRegisterUseCase(this.domainRepository);

  Future<void> call(String email, String password) async {
    return domainRepository.register(email, password);
  }
}