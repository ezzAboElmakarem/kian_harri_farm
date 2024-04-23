import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/my_orders/bloc/order_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/bloc/order_details_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/views/order_details_view.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/widgets/empty_data_view.dart';
import '../widgets/order_item.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Empty) {
          return const EmptyDataScreen();
        } else if (state is Error) {
          return Center(child: Text('error_getting_data'.tr()));
        } else if (state is Done) {
          var bloc = MyOrdersBloc.get(context);
          return ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 4.w,
              ),
              itemBuilder: (context, index) => OrderItem(
                    onTap: () {
                      MyOrdersDetailsBloc.of(context).add(Click(
                          arguments:
                              bloc.ordersData.data!.newOrder![index].id!));
                      navigateTo(
                          context: context,
                          widget: OrderDetailsView(
                            orderStatus:
                                bloc.ordersData.data!.newOrder![index].status!,
                            // orderDetails: MyOrdersDetailsBloc.of(context)
                            //     .myOrdersDetailsData,
                          ));
                    },
                    orderID: bloc.ordersData.data!.newOrder![index].id!,
                    orderStatus: bloc.ordersData.data!.newOrder![index].status!,
                    date: bloc.ordersData.data!.newOrder![index].date!,
                    name: bloc.ordersData.data!.newOrder![index].note ?? '',
                    price: bloc.ordersData.data!.newOrder![index].finalPrice!,
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: bloc.ordersData.data!.newOrder!.length);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
