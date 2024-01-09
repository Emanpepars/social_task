import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_screen/features/home/data/data_sources/home_dto_sources.dart';
import 'package:post_screen/features/home/data/repositories/home_data_repo.dart';
import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';
import 'package:post_screen/features/home/domain/use_cases/posts_use_case.dart';
import 'package:post_screen/features/home/presentation/manager/states.dart';

import '../../domain/repositories/home_domain_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSource homeDataSource;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSource) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSource);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  List<PostEntity> posts = [];

  getAllPosts() async {
    emit(HomeLoadingState());
    AllPostsUseCase getAllPostsUseCase = AllPostsUseCase(homeDomainRepo);
    var result = await getAllPostsUseCase.call();
    result.fold((l) {
      emit(HomeGetAllPostsErrorState(l));
    }, (r) {
      posts = r.posts ?? [];
      emit(HomeGetAllPostsSuccessState(r));
    });
  }
}
