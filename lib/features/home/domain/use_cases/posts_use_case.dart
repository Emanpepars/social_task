import 'package:dartz/dartz.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../repositories/home_domain_repo.dart';

class AllPostsUseCase {
  HomeDomainRepo homeDomainRepo;

  AllPostsUseCase(this.homeDomainRepo);

  Future<Either<Failures, AllPostsEntity>> call() =>
      homeDomainRepo.getAllPosts();
}
