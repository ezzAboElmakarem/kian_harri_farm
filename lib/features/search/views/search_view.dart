import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/search/bloc/search_bloc.dart';
import 'package:kian_sheeps_projects/features/search/widgets/search_form_field.dart';
import 'package:kian_sheeps_projects/features/search/widgets/search_product_card.dart';

import '../widgets/search_body_title.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: customAppBar(context: context, title: "search".tr()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              const SearchBodyTitle(),
              const SliverToBoxAdapter(
                child: SearchTextFormField(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40.h,
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<SearchBloc, AppState>(
                  builder: (context, state) {
                    final bloc = SearchBloc.get(context);
                    if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    } else if (state is Done) {
                      return Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .7 / 0.9,
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                          ),
                          itemCount: bloc.searchData.data!.length,
                          itemBuilder: (context, index) {
                            return SearchProductCard(
                              isFavourite:
                                  bloc.searchData.data?[index].like ?? false,
                              searchItem: bloc.searchData.data![index],
                            );
                          },
                        ),
                      );
                    } else if (state is Error) {
                      return Text(bloc.searchData.message.toString());
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
