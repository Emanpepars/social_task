import 'package:dartz/dartz.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../../../../core/failures/failures.dart';
import '../repositories/add_post_domain_repo.dart';

class AddPostUseCase {
  AddPostDomainRepo addPostDomainRepo;

  AddPostUseCase(this.addPostDomainRepo);

  Future<Either<Failures,PostEntity>>call(PostEntity postEntity)=> addPostDomainRepo.addPost(postEntity);

}