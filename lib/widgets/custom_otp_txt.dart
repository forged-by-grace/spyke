import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spyke/utility/constants.dart';

import '../redux/appstate.dart';

class CustomOTPWidget extends StatefulWidget {
  final double height;
  final double width;
  final ValueChanged firstDigit;
  final ValueChanged secondDigit;
  final ValueChanged thirdDigit;
  final ValueChanged forthDigit;
  final GlobalKey<FormState> formKey;

  const CustomOTPWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.firstDigit,
      required this.secondDigit,
      required this.thirdDigit,
      required this.forthDigit,
      required this.formKey});

  @override
  State<CustomOTPWidget> createState() => _CustomOTPWidgetState();
}

class _CustomOTPWidgetState extends State<CustomOTPWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TxtBoxWidget(
                height: widget.height,
                width: widget.width,
                onChange: widget.firstDigit),
            TxtBoxWidget(
                height: widget.height,
                width: widget.width,
                onChange: widget.secondDigit),
            TxtBoxWidget(
                height: widget.height,
                width: widget.width,
                onChange: widget.thirdDigit),
            TxtBoxWidget(
                height: widget.height,
                width: widget.width,
                onChange: widget.forthDigit),
          ],
        ));
  }
}

class TxtBoxWidget extends StatelessWidget {
  const TxtBoxWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.onChange,
  }) : super(key: key);

  final double height;
  final double width;
  final ValueChanged onChange;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, themeState) => SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          onChanged: onChange,
          decoration: const InputDecoration(
            hintText: '*',
            hintStyle: TextStyle(
              fontSize: fontSizeModerate,
              fontWeight: FontWeight.bold,
            ),
            labelStyle: TextStyle(
              fontSize: fontSizeModerate,
              fontWeight: FontWeight.bold,
            ),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
