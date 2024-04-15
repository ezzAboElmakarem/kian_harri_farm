import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/assets.dart';
import '../../../helper/text_styles.dart';

class ServiceRatingWidget extends StatelessWidget {
  const ServiceRatingWidget({
    super.key,
    required this.service,
    required this.onRateUpdate,
  });
  final String service;
  final void Function(double) onRateUpdate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Text(service, style: TextStyles.textstyle14),
          const Spacer(),
          RatingBar.builder(
            itemSize: 24.sp,
            initialRating: 0,
            minRating: 0.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
            itemBuilder: (context, _) => Image.asset(AssetsData.star),
            onRatingUpdate: onRateUpdate,
          ),
        ],
      ),
    );
  }
}
