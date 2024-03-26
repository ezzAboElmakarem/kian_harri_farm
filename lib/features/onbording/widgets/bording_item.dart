import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';
import '../models/onbording_model.dart';

Widget buildBordingItem(BordingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: SvgPicture.asset(model.image, fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          model.title,
          style: TextStyles.textstyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          model.body,
          //     textAlign: TextAlign.right,
          textScaler: TextScaler.noScaling,
          style:
              TextStyles.textstyle14.copyWith(color: ColorStyles.textGreyColor),
        ),
      ],
    );
