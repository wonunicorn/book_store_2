import 'package:book_app/feature/domain/entities/entities.dart';

abstract class RemoteDataSource{
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();

  Future<Books> getFictions();
  Future<Books> getNovels();
  Future<Books> getHorrors();
  Future<Books> getActions();
  Future<Items> getDetails(String id);
}