import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../search/views/search.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../widgets/custom_tex_form_field.dart';

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
          hint: "search_hint".tr(),
          prefixIcon: context.locale == const Locale('ar')
              ? Icon(
                  Icons.search_outlined,
                  color: ColorStyles.textGreyColor.withOpacity(0.4),
                )
              : null,
          suffixIcon: context.locale == const Locale('en')
              ? Icon(
                  Icons.search_outlined,
                  color: ColorStyles.textGreyColor.withOpacity(0.4),
                )
              : null,

          // prefixIcon: isArabic() == false
          //     ? Icon(
          //         Icons.search_outlined,
          //         color: ColorStyles.textGreyColor.withOpacity(0.4),
          //       )
          //     : null,
        ),
      ),
    );
  }
}
