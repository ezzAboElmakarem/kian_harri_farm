import 'package:flutter/material.dart';
import 'bottom_Sheet_title.dart';
import 'bottom_sheet_radios.dart';

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
            BottomSheetRadiosList(),
          ],
        ),
      ),
    );
  }
}
