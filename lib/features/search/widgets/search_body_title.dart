import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SearchBodyTitle extends StatelessWidget {
  const SearchBodyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: Text('ابحث عن منتجاتك هنا',
            textAlign: TextAlign.right,
            style:
                TextStyles.textstyle20.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
