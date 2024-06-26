import 'package:flutter/material.dart';

//? Select Date :
Future<void> selecteDate(
    BuildContext context, TextEditingController controller) async {
  //? Parse the current text field value to set as initialDate
  DateTime initialDate = DateTime.now();
  if (controller.text.isNotEmpty) {
    initialDate = DateTime.parse(controller.text);
  }

  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    controller.text = selectedDate.toString().substring(0, 10);
  }
}
