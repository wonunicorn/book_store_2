import 'package:book_app/core/exception/exception.dart';
import 'package:book_app/feature/data/data_source/book_remote_data_source.dart';
import 'package:book_app/feature/domain/entities/book_model.dart';
import 'package:dio/dio.dart';

import 'package:book_app/core/utils/api_constants.dart';

class BookRemoteDataSourceImpl extends BookRemoteDataSource{
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

}