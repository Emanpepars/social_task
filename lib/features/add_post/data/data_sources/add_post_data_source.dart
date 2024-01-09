import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/core/utils/constants.dart';
import 'package:post_screen/features/home/data/models/all_posts_model.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../../../../core/api/end_points.dart';

abstract class AddPostDto {
  Future<Either<Failures, Posts>> addPost(PostEntity postEntity);
}

class RemoteAddPostDto implements AddPostDto {
  Dio dio = Dio();

  @override
  Future<Either<Failures, Posts>> addPost(PostEntity postEntity) async {
    try {
      var response =
          await dio.post("${Constants.baseUrl}${EndPoints.addPost}", data: {
        "title": postEntity.title,
         "body": postEntity.body,
         "userId": postEntity.userId,
         "tags": postEntity.tags,
      });
      Posts post = Posts.fromJson(response.data);
      return Right(post);
    } catch (e) {
      return Left(ServerFailures(
        e.toString(),
      ));
    }
  }
}

class LocalDto implements AddPostDto {
  @override
  Future<Either<Failures, Posts>> addPost(PostEntity postEntity) {
    // TODO: implement addPost
    throw UnimplementedError();
  }
}
