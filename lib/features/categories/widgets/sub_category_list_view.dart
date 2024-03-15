import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/sub_category_item.dart';

class SubCategoryListView extends StatefulWidget {
  const SubCategoryListView({
    super.key,
  });

  @override
  State<SubCategoryListView> createState() => _SubCategoryListViewState();
}

class _SubCategoryListViewState extends State<SubCategoryListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 55.h,
        width: double.infinity,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return SubCategoryItem(
              isSelected: index == selectedIndex,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
