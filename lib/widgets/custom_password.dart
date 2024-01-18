import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utility/constants.dart';
import '../utility/password_validator.dart';

class CustomPassword extends StatefulWidget {
  final String label;
  final String hint;
  final ValueChanged onchange;
  final String? prevPassword;
  final bool? validate;

  const CustomPassword(
      {super.key,
      required this.label,
      required this.hint,
      required this.onchange,
      this.prevPassword,
      this.validate});

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !showPassword,
      onChanged: widget.onchange,
      validator: (value) {
        if (widget.validate == null || widget.validate == true) {
          if (value == '') {
            return '${widget.label} cannot be empty';
          } else if (widget.prevPassword != null &&
              value != widget.prevPassword) {
            return 'Passwords do not match';
          } else if (widget.prevPassword == null &&
              value!.length < kDefaultPasswordLength) {
            return '${widget.label} must be at least 6 digits';
          } else if (widget.prevPassword == null &&
              !validPassword(value.toString())) {
            return '${widget.label} must contain capital and small letters, numbers and special characters';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        prefixIcon: const Icon(
          FontAwesomeIcons.lock,
          size: 24,
        ),
        errorStyle: const TextStyle(fontSize: fontSizeSmall),
        errorMaxLines: 2,
        suffixIcon: IconButton(
            tooltip: 'Toggle visibility',
            enableFeedback: false,
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off)),
      ),
    );
  }
}
