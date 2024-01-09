import 'package:dartz/dartz.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, AllPostsEntity>> getAllPosts();
}
