import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final ValueChanged onChange;

  const CustomTextField({super.key, required this.label, required this.hint, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                prefixIcon: const Icon(Ionicons.person_outline),
              ),
              onChanged: onChange,
              validator: ((value) {
                if (value == '') {
                  return '$label is required';
                }
                return null;
              }),
            );
  }
}
