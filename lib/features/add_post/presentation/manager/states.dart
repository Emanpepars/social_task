import '../../../../core/failures/failures.dart';
import '../../../home/domain/entities/all_posts_entity.dart';

abstract class AddPostStates {}

class AddPostInitState extends AddPostStates {}

class AddPostLoadingStates extends AddPostStates {}

class AddPostSuccessState extends AddPostStates {
  PostEntity postEntity;

  AddPostSuccessState(this.postEntity);
}

class AddPostFailureState extends AddPostStates {
  Failures failures;

  AddPostFailureState(this.failures);
}
