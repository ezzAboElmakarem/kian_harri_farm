import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/categories_bloc.dart';
import 'custom_radio_tile_item.dart';

class BottomSheetRadiosList extends StatefulWidget {
  const BottomSheetRadiosList({super.key});

  @override
  State<BottomSheetRadiosList> createState() => _BottomSheetRadiosListState();
}

class _BottomSheetRadiosListState extends State<BottomSheetRadiosList> {
  String selectedOption = '';
  List<Map<String, dynamic>> filters = [
    {
      "id": 0,
      "title": "الكل",
      "titleEn": "all",
    },
    {
      "id": 1,
      "title": "الاكثر مبيعا",
      "titleEn": "Best seller",
    },
    {
      "id": 2,
      "title": "الاعلى تقييمًا",
      "titleEn": "Highest rated",
    },
    {
      "id": 3,
      "title": "من السعر الاعلي الي الاقل",
      "titleEn": "From the highest price to the lowest",
    },
    {
      "id": 4,
      "title": "من السعر الاقل الي الاعلى",
      "titleEn": "From the lowest price to the highest",
    },
  ];
  // @override
  // void initState() {
  //   selectedOption = options[0];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: filters.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomRadioTileItem(
          title: filters[index]["title"],
          groupValue: selectedOption,
          value: filters[index]["id"].toString(),
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
            CategoriesBloc.of(context)
                .add(Click(arguments: selectedOption.toString()));
          },
          selected: selectedOption == filters[index]['id'],
        );
      },
    );
  }
}
