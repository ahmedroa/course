import 'package:flutter/material.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required String Label,
  required TextInputType inputType,
  bool isDense = false,
}) =>
    TextFormField(
      obscureText: isDense,
      validator: (value) {
        if (value!.isEmpty) {
          return 'لا يمكن ترك الحقل فارغ ';
        }

        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        label: Text(
          Label,
        ),
      ),
      keyboardType: inputType,
    );
