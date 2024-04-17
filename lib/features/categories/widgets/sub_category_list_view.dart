import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/category_Items_bloc.dart';
import 'package:kian_sheeps_projects/features/categories/models/categories_model.dart';
import 'sub_category_item.dart';

class SubCategoryListView extends StatefulWidget {
  const SubCategoryListView({
    super.key,
    this.subCategory,
  });
  final List<SubCategory>? subCategory;

  @override
  State<SubCategoryListView> createState() => _SubCategoryListViewState();
}

class _SubCategoryListViewState extends State<SubCategoryListView> {
  int? selectedIndex = 0;

  // @override
  // void initState() {
  //   CategoriesBloc.of(context)
  //       .add(Read(arguments: widget.subCategory!.first.id!.toString()));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 55.h,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.subCategory!.length,
          itemBuilder: (BuildContext context, int index) {
            return SubCategoryItem(
                isSelected: index == selectedIndex,
                onTap: () {
                  CategoryItemsBloc.of(context).add(Read(
                    arguments: widget.subCategory![index].id.toString(),
                  ));

                  setState(() {
                    selectedIndex = index;
                  });
                },
                subCartegoriesName: widget.subCategory![index].name ?? "dd");
          },
        ),
      ),
    );
  }
}
