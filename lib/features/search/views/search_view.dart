import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/search/bloc/search_bloc.dart';
import 'package:kian_sheeps_projects/features/search/widgets/search_product_card.dart';

import '../widgets/search_body_title.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../widgets/custom_tex_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = SearchBloc.get(context);
    return Form(
      key: bloc.formkey,
      child: Scaffold(
        appBar: customAppBar(context: context, title: 'البحث'),
        body: BlocProvider(
          create: (context) => SearchBloc(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              slivers: [
                const SearchBodyTitle(),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    ispassword: false,
                    isEnabled: true,
                    hint: 'ابحث عن منتج',
                    controller: bloc.searchController,
                    onChange: (value) {
                      bloc.add(Get());
                    },
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      color: ColorStyles.textGreyColor.withOpacity(0.4),
                    ),
                  ),
                ),
                BlocBuilder<SearchBloc, AppState>(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6.h,
                            crossAxisSpacing: 32.w,
                            childAspectRatio: 3 / 6.4,
                          ),
                          itemCount: bloc.searchData.data!.length,
                          itemBuilder: (context, index) {
                            return SearchProductCard(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
