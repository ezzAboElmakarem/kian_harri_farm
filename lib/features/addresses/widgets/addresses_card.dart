import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/addresses/model/address_model.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class AddressesCard extends StatelessWidget {
  const AddressesCard({
    super.key,
    required this.addressdata,
  });
  final Data addressdata;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 142.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kPrimaryColor,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  addressdata.name ?? "محمد الحديدى",
                  style: TextStyles.textstyle14.copyWith(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.topLeft,
                    child:
                        Image.asset(AssetsData.editIcon, fit: BoxFit.contain)),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              addressdata.phone == null || addressdata.phone == ""
                  ? "73366363"
                  : addressdata.phone ?? "73763636",
              style: TextStyles.textstyle14.copyWith(
                color: ColorStyles.textGreyColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              addressdata.addressDetails ?? "جدة 23 شارع عبد القدوس الانصارى",
              maxLines: 2,
              style: TextStyles.textstyle14.copyWith(
                color: ColorStyles.textGreyColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
