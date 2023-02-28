import 'package:book_app/feature/domain/repository/repository.dart';

class GetLoginUseCase{
  final Repository domainRepository;

  GetLoginUseCase(this.domainRepository);

  Future<void> call(String email, String password) async {
    return domainRepository.login(email, password);
  }
}