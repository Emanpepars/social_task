import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_screen/core/utils/app_colors.dart';
import 'package:post_screen/core/utils/app_localization.dart';
import 'package:post_screen/core/utils/text_styles.dart';
import 'package:post_screen/cubit/cubit.dart';
import 'package:post_screen/cubit/states.dart';
import 'package:post_screen/features/home/data/data_sources/home_dto_sources.dart';
import 'package:post_screen/features/home/presentation/manager/states.dart';
import '../../../../config/routes.dart';
import '../manager/cubit.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteHomeDto())..getAllPosts(),
      child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
        if (state is HomeLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.black87,
              elevation: 0,
              title: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is HomeGetAllPostsErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error".tr(context)),
              content: Text(state.failures.message),
            ),
          );
        }
      }, builder: (BuildContext context, HomeStates state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "feeds".tr(context),
              style: quicksand20W800(),
            ),
            actions: [
              BlocBuilder<LocaleCubit, ChangeLocaleState>(
                  builder: (context, state) {
                return DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ["ar", "en"].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Text(
                          items,
                          style: quicksand20W800(),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocaleCubit>().changeLanguage(newValue);
                    }
                  },
                );
              })
            ],
          ),
          body: Container(
            color: Colors.white,
            child: ListView.separated(
              itemCount: HomeCubit.get(context).posts.length,
              itemBuilder: (context, index) {
                final post = HomeCubit.get(context).posts[index];
                return Post(post);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 8.h,
                  thickness: 8.sp,
                  color: const Color(0xFFe3e5e9),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addPostScreen);
            },
            backgroundColor: AppColors.onPrimary,
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
