import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/sort_by_bottom_sheet/widgets/bottom_Sheet_title.dart';
import 'package:kian_sheeps_projects/features/sort_by_bottom_sheet/widgets/bottom_sheet_radios.dart';

class SortBySheet extends StatelessWidget {
  const SortBySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BottomSheetTitle(),
            BottomSheetRadios(),
          ],
        ),
      ),
    );
  }
}
