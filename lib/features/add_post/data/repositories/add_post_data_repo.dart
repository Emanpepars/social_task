import 'package:dartz/dartz.dart';
import 'package:post_screen/core/failures/failures.dart';
import 'package:post_screen/features/add_post/data/data_sources/add_post_data_source.dart';
import 'package:post_screen/features/add_post/domain/repositories/add_post_domain_repo.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

class AddPostDataRepo implements AddPostDomainRepo{
  AddPostDto addPostDto;
  AddPostDataRepo(this.addPostDto);
  @override
  Future<Either<Failures, PostEntity>> addPost(PostEntity postEntity) =>addPostDto.addPost(postEntity);

}