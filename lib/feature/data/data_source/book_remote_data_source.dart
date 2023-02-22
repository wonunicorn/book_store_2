import 'package:book_app/feature/domain/entities/book_model.dart';

abstract class BookRemoteDataSource{
  Future<Books> getFictions();
  Future<Books> getNovels();
  Future<Books> getHorrors();
  Future<Books> getActions();
  Future<Items> getDetails(String id);
}