

import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../../../../core/failures/failures.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetAllPostsSuccessState extends HomeStates {
  AllPostsEntity allPostsEntity;

  HomeGetAllPostsSuccessState(this.allPostsEntity);
}

class HomeGetAllPostsErrorState extends HomeStates {
  Failures failures;

  HomeGetAllPostsErrorState(this.failures);
}

