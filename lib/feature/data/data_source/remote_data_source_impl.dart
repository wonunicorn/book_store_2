import 'package:book_app/core/exception/exception.dart';
import 'package:book_app/feature/data/data_source/remote_data_source.dart';
import 'package:book_app/feature/domain/entities/entities.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_app/core/utils/api_constants.dart';

class RemoteDataSourceImpl extends RemoteDataSource{

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  RemoteDataSourceImpl(this.firebaseAuth, this.firebaseFirestore);

  @override
  Future<Books> getActions() async{
    try{
      final response = await Dio().get(ApiConstants.getActionUrl);
      if(response.statusCode == 200){
        return Books.fromJson(response.data);
      }
      else{
        throw ServerException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<Items> getDetails(String id) async{
    try{
      final url = ApiConstants.baseUrlWithId + id;
      final response = await Dio().get(url);
      if(response.statusCode == 200){
        return Items.fromJson(response.data);
      }
      else{
        throw ServerException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<Books> getFictions() async{
    try{
      final response = await Dio().get(ApiConstants.getFictionUrl);
      if(response.statusCode == 200){
        return Books.fromJson(response.data);
      }
      else{
        throw ServerException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<Books> getHorrors() async{
    try{
      final response = await Dio().get(ApiConstants.getHorrorUrl);
      if(response.statusCode == 200){
        return Books.fromJson(response.data);
      }
      else{
        throw ServerException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<Books> getNovels() async{
    try{
      final response = await Dio().get(ApiConstants.getNovelUrl);
      if(response.statusCode == 200){
        return Books.fromJson(response.data);
      }
      else{
        throw ServerException();
      }
    }catch (e){
      rethrow;
    }
  }

  @override
  Future<void> login(String email, String password) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(error){
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async{
    try{
      await firebaseAuth.signOut();
    }catch(e){
      throw ServerException();
    }
  }

  @override
  Future<void> register(String email, String password) async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      throw ServerException();
    }
  }

}