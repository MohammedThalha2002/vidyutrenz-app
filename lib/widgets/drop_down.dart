import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/colors.dart';
import 'package:vidyutrenz_app/controller/year_value_controller.dart';

class DropdownForYearSelection extends StatelessWidget {
  DropdownForYearSelection({Key? key}) : super(key: key);
  String? YearValue;
  YearValueController yearValueController = Get.put(YearValueController());
  List<String> Years = [
    "I Year",
    "II Year",
    "III Year",
    "IV Year",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Obx(
                () => Expanded(
                  child: yearValueController.year.value == ""
                      ? Text(
                          "Enter Your year here",
                          style: TextStyle(
                            color: colors.lightColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          yearValueController.year.value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ],
          ),
          items: Years.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )).toList(),
          value: YearValue,
          onChanged: (value) {
            yearValueController.changeYearValue(
              yearValue: value as String,
            );
          },
          buttonWidth: MediaQuery.of(context).size.width,
          buttonPadding: EdgeInsets.all(12),
          buttonDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 2.0,
              color: colors.lightColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: EdgeInsets.symmetric(horizontal: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 300,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
        ),
      ),
    );
  }
}
