import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/bloc/order_details_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import 'package:kian_sheeps_projects/features/payment/widgets/customer_shipping_details.dart';
import '../../../widgets/payment_summary.dart';
import '../widgets/products_details_list.dart';
import '../widgets/refused_reason.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/custom_button.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.orderStatus,
  });
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'تفاصيل الطلب'),
      body: BlocBuilder<MyOrdersDetailsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = MyOrdersDetailsBloc.of(context);
            MyOrderDetailsModel myOrderDetailsModel = bloc.myOrdersDetailsData;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Image.asset(AssetsData.box)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child:
                          Text('المجموع الكلي', style: TextStyles.textstyle14),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Text(myOrderDetailsModel.data!.total!,
                          style: TextStyles.textstyle14),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Text(
                          orderStatus.contains('مرفوض') ? 'مرفوض' : orderStatus,
                          style: TextStyles.textstyle14.copyWith(
                              color: orderStatus == 'refuse' ||
                                      orderStatus == 'تم الرفض'
                                  ? ColorStyles.redColor
                                  : kPrimaryColor)),
                    ),
                    ProductsDetailsList(
                        orderID: myOrderDetailsModel.data!.id!,
                        orderDetailsModel: myOrderDetailsModel),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('بيانات التوصيل', style: TextStyles.textstyle14),
                        SizedBox(
                          height: 16.h,
                        ),
                        const PaymentShippingDetails(),
                        // DeliverySummary(
                        //     isEditing: false,
                        //     orderDetails: myOrderDetailsModel),
                        SizedBox(
                          height: 20.h,
                        ),
                        orderStatus == 'refuse' || orderStatus == 'تم الرفض'
                            ? const RefusedReason()
                            : PaymentSummary(
                                cartDataModel: CartBloc.of(context).cartData,
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Center(
                        child: CustomButton(
                            buttonText: 'اعادة الطلب مرة اخري', onTap: () {})),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
