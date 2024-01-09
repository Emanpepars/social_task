import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:post_screen/core/utils/app_colors.dart';
import 'package:post_screen/core/utils/app_localization.dart';
import 'package:post_screen/features/add_post/data/data_sources/add_post_data_source.dart';
import 'package:post_screen/features/add_post/presentation/manager/cubit.dart';
import 'package:post_screen/features/add_post/presentation/manager/states.dart';
import 'package:post_screen/features/add_post/presentation/widgets/text_field.dart';
import '../../../../core/utils/text_styles.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(RemoteAddPostDto()),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddPostLoadingStates) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
            );
          } else if (state is AddPostFailureState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title:  Text("Error".tr(context)),
                content: Text(state.failures.message),
              ),
            );
          } else if (state is AddPostSuccessState) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: "Post_added_Successfully!".tr(context),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.onPrimary,
              textColor: Colors.white,
              timeInSecForIosWeb: 1,
              fontSize: 18.sp,
            );
          }
        },
        builder: (BuildContext context, AddPostStates state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.onPrimary,
              ),
            ),
            title: Text(
              'add_your_post'.tr(context),
              style: quicksand20W800(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: AddPostCubit.get(context).formKey,
              child: SizedBox(
                height: 1000.h,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Title".tr(context),
                        style: quicksand18(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefaultFormField(
                        controller: AddPostCubit.get(context).titleController,
                        label: "title".tr(context),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Body".tr(context),
                        style: quicksand18(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefaultFormField(
                        maxLength: 1000,
                        controller: AddPostCubit.get(context).bodyController,
                        label: "body".tr(context),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "user_id".tr(context),
                        style: quicksand18(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefaultFormField(
                        number: true,
                        maxLength: 1000,
                        controller: AddPostCubit.get(context).userIdController,
                        label: "user_id".tr(context),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.onPrimary),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (AddPostCubit.get(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              AddPostCubit.get(context).addPost();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0.w, vertical: 2.h),
                            child: Row(
                              children: [
                                Text(
                                  "+ ",
                                  style: quicksand18()
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  "add_post".tr(context),
                                  style: quicksand18()
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
