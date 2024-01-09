import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_screen/core/api/end_points.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/core/utils/constants.dart';
import 'package:post_screen/features/home/data/models/all_posts_model.dart';

abstract class HomeDataSource {
  Future<Either<Failures, AllPostsModel>> getAllPosts();
}

class RemoteHomeDto implements HomeDataSource {
  @override
  Future<Either<Failures, AllPostsModel>> getAllPosts() async {
    Dio dio = Dio();
    try {
      var response =
          await dio.get("${Constants.baseUrl}${EndPoints.getAllPosts}");
      AllPostsModel model = AllPostsModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalHomeDto implements HomeDataSource {
  @override
  Future<Either<Failures, AllPostsModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
}
