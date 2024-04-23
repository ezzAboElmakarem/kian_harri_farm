import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/addresses/model/address_model.dart';
import 'package:kian_sheeps_projects/features/payment/bloc/payment_bloc.dart';
import 'package:kian_sheeps_projects/features/shipping_address/bloc/customer_address_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/app_text.dart';

class PaymentShippingDetails extends StatelessWidget {
  const PaymentShippingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerAddressBloc, AppState>(
      builder: (context, state) {
        final shippingAddressBloc = CustomerAddressBloc.of(context);
        final paymentBloc = PaymentBloc.of(context);

        AddressesModel addressesModel = shippingAddressBloc.addressesData;

        int? parsedAddressId = int.tryParse(paymentBloc.addressId ?? '');

        Address address = addressesModel.addresses?.firstWhere(
              (element) => element.id == parsedAddressId,
              orElse: () => Address(),
            ) ??
            Address();

        return Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              // height: 142.height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kPrimaryColor,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: address.name ?? "dummy",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 4.h),
                    address.phone == ""
                        ? const SizedBox()
                        : AppText(
                            title: address.phone ?? "dummy",
                            fontSize: 14,
                            color: ColorStyles.textGreyColor,
                          ),
                    SizedBox(height: 4.h),
                    AppText(
                      title: address.addressDetails ?? "dummy",
                      fontSize: 14,
                      color: ColorStyles.textGreyColor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
