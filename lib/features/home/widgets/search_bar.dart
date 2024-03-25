import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/search/views/search.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          navigateTo(context: context, widget: const SearchView());
        },
        // refactor it to simple raw wraped with container
        child: CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          hint: S.of(context).search_hint,
          suffixIcon: isArabic()
              ? Icon(
                  Icons.search_outlined,
                  color: ColorStyles.textGreyColor.withOpacity(0.4),
                )
              : null,
          prefixIcon: isArabic() == false
              ? Icon(
                  Icons.search_outlined,
                  color: ColorStyles.textGreyColor.withOpacity(0.4),
                )
              : null,
        ),
      ),
    );
  }
}
