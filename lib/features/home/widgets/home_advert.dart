import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';

class HomeAdverts extends StatelessWidget {
  const HomeAdverts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc.get(context);
    return Center(
      child: Image.network(
        bloc.homeData.advert!.image!,
        height: 92.h,
        width: 92.w,
      ),
    );
  }
}
