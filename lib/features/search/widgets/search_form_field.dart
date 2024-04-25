import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/search/bloc/search_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = SearchBloc.get(context);

    return Form(
      key: bloc.formkey,
      child: CustomTextFormField(
        ispassword: false,
        isEnabled: true,
        hint: 'search_hint'.tr(),
        controller: bloc.searchController,
        onChange: (value) {
          bloc.add(Get());
        },
        prefixIcon: Icon(
          Icons.search_outlined,
          color: ColorStyles.textGreyColor.withOpacity(0.4),
        ),
      ),
    );
  }
}
