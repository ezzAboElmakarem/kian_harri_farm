import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/sub_category_item.dart';

class SubCategoryListView extends StatelessWidget {
  const SubCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const SubCategoryItem();
          },
        ),
      ),
    );
  }
}
