import 'package:dartz/dartz.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../../../../core/failures/failures.dart';

abstract class AddPostDomainRepo {
  Future<Either<Failures, PostEntity>> addPost(PostEntity postEntity);
}
