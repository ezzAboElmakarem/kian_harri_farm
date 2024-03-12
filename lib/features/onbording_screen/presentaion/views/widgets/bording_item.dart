import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/data/onbording_model.dart';

Widget buildBordingItem(BordingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: SvgPicture.asset(model.image, fit: BoxFit.contain),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          model.title,
          style: Styles.textstyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          model.body,
          textAlign: TextAlign.right,
          style: Styles.textstyle14.copyWith(color: ColorStyles.textGreyColor),
        ),
      ],
    );
