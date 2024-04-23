import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/widgets/empty_data_view.dart';
import '../widgets/cart_buttons.dart';
import '../widgets/cart_orders.dart';
import '../widgets/coubon_field.dart';
import '../../../widgets/payment_summary.dart';
import '../../../helper/app_bar_method.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'cart'.tr(),
      ),
      body: BlocBuilder<CartBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Empty) {
            return const EmptyDataScreen();
          } else {
            var bloc = CartBloc.of(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    CartOrders(
                        cartDataModel: bloc.cartData,
                        itemData: bloc.increaseItemData),
                    SizedBox(
                      height: 16.h,
                    ),
                    const CoubonField(),
                    SizedBox(
                      height: 24.h,
                    ),
                    PaymentSummary(cartDataModel: bloc.cartData),
                    SizedBox(
                      height: 60.h,
                    ),
                    const CartButtons(),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
