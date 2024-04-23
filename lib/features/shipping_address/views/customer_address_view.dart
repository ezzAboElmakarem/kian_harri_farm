import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/shipping_address/bloc/customer_address_bloc.dart';
import 'package:kian_sheeps_projects/features/shipping_address/customer_address_form.dart';
import '../../../helper/app_bar_method.dart';
import '../../../widgets/custom_button.dart';

class CustomerAddressView extends StatelessWidget {
  const CustomerAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'العنوان',
        ),
        body: BlocBuilder<CustomerAddressBloc, AppState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Error) {
              return Center(child: Text('error_getting_data'.tr()));
            } else {
              var bloc = CustomerAddressBloc.of(context);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomerAddressForms(
                        addressData: bloc.addressesData,
                      ),

//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'الأسم',
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'رقم الجوال',
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: ' رقم جوال اضافي',
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'العنوان بالتفصيل',
//               ),
//               SizedBox(height: 10.h),
// //*******************************************************************************************************
//               // CountryDropDown(
//               //   fieldTitle: 'المدينة',
//               //   dataList: const [
//               //     'المحلة',
//               //     'المنصورة',
//               //     'القاهرة ',
//               //     'الجيزة',
//               //   ],
//               //   onChange: (value) {
//               //     log('changing value to: $value');
//               //   },
//               // ),
// //*******************************************************************************************************

//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'الحي',
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'اسم الشارع',
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'رقم السكن',
//               ),
//               SizedBox(height: 10.h),
//               GestureDetector(
//                 onTap: () {
//                   navigateTo(context: context, widget: const ShippingAddress());
//                   log('$args');
//                 },
//                 child: CustomTextFormField(
//                   ispassword: false,
//                   isEnabled: false,
//                   title: 'تحديد موقع الاستلام على الخريطة',
//                   controller: TextEditingController(text: args),
//                   prefixIcon: Image.asset(AssetsData.arrowPointer),
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               CustomTextFormField(
//                 ispassword: false,
//                 isEnabled: true,
//                 title: 'اضف ملاحظات على الطلب',
//                 maxLines: 6,
//               ),

                      SizedBox(height: 40.h),
                      const NextButton(),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = CustomerAddressBloc.of(context);
    return CustomButton(
      buttonText: 'next'.tr(),
      onTap: () {
        if (!bloc.formkey.currentState!.validate()) return;

        CustomerAddressBloc.of(context).add(Click());
      },
    );
    // return BlocBuilder<AddAddressBloc, AppState>(
    //   builder: (context, state) {
    //     if (state is Loading) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: kPrimaryColor,
    //         ),
    //       );
    //     } else if (state is Error) {
    //       return CustomButton(
    //         buttonText: 'next'.tr(),
    //         onTap: () {
    //           AddAddressBloc.of(context).add(Click());
    //         },
    //       );
    //     } else {
    //       BlocProvider.of<AddAddressBloc>(context).add(Reset());

    //       return CustomButton(
    //         buttonText: "next".tr(),
    //         onTap: () {
    //           AddAddressBloc.of(context).add(Click());
    //           RouteUtils.navigateAndPopUntilFirstPage(PaymentView(
    //             orderDetails:
    //                 MyOrdersDetailsBloc.of(context).myOrdersDetailsData,
    //           ));
    //         },
    //       );
    //     }
    //   },
    // );

    // return CustomButton(
    //     buttonText: 'التالي',
    //     onTap: () {
    //       AddAddressBloc.of(context).add(Click());
    //       navigateTo(
    //           context: context,
    //           widget: PaymentView(
    //             orderDetails: MyOrdersDetailsBloc.of(context)
    //                 .myOrdersDetailsData,
    //           ));
    //     });
  }
}
