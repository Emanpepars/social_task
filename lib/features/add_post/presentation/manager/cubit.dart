import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_screen/features/add_post/data/data_sources/add_post_data_source.dart';
import 'package:post_screen/features/add_post/presentation/manager/states.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

import '../../data/repositories/add_post_data_repo.dart';
import '../../domain/repositories/add_post_domain_repo.dart';
import '../../domain/use_cases/add_post_use_case.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostDto sources;

  AddPostCubit(this.sources) : super(AddPostInitState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  void addPost() async {
    emit(AddPostLoadingStates());
    AddPostDomainRepo addPostDomainRepo = AddPostDataRepo(sources);
    AddPostUseCase addPostUseCase = AddPostUseCase(addPostDomainRepo);
    PostEntity postEntity = PostEntity(
      title: titleController.text,
      body: bodyController.text,
      userId: int.parse(userIdController.text),
      tags: [
        "english",
        "classic",
      ],
    );
    var result = await addPostUseCase.call(postEntity);
    result.fold((l) {
      emit(AddPostFailureState(l));
    }, (r) {
      emit(AddPostSuccessState(r));
    });
  }


}
