import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/text_styles.dart';

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
        child: Text('search_here'.tr(),
            style:
                TextStyles.textstyle20.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
