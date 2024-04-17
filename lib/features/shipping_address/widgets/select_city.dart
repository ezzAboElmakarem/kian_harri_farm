// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kian_sheeps_projects/features/add_address/views/model/cities_and_regions_model.dart';
// import '../../../helper/color_styles.dart';
// import '../../../helper/text_styles.dart';

// // ignore: must_be_immutable
// class CountryDropDown extends StatelessWidget {
//   CountryDropDown({
//     super.key,
//     required this.fieldTitle,
//     this.dataList,
//     required this.onChange,
//   });
//   final dynamic Function(CitiesAndRegionsData) onChange;
//   final String fieldTitle;
//   final List<CitiesAndRegionsData>? dataList;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           fieldTitle,
//           style: TextStyles.textstyle16,
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         CustomDropdown<CitiesAndRegionsData>(
//           //hintText: 'اختار المدينة',
//           items: dataList?.map((e) => e.name.toString()).toList(),
//           decoration: CustomDropdownDecoration(
//               closedFillColor: ColorStyles.textFormFieldfillColor),
//           // initialItem: dataList?[0] ?? 'اضغط للاختيار',
//           onChanged: onChange,
//           //  (value) {
//           //   log('changing value to: $value');
//           //   //  CitiesAndRegionsBloc.of(context).add(Read(
//           //   //             arguments:
//           //   //            ));
//           // },
//         ),
//       ],
//     );
//   }
// }
