import 'package:dartz/dartz.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/features/home/data/data_sources/home_dto_sources.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';
import 'package:post_screen/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSource homeDataSource;

  HomeDataRepo(this.homeDataSource);

  @override
  Future<Either<Failures, AllPostsEntity>> getAllPosts() =>
      homeDataSource.getAllPosts();
}
