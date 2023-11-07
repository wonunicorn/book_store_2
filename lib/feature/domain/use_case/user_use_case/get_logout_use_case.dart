import 'package:book_app/feature/domain/repository/repository.dart';

class GetLogoutUseCase{
  final Repository domainRepository;

  GetLogoutUseCase(this.domainRepository);

  Future<void> call() async {
    return domainRepository.logout();
  }
}