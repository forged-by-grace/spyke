import 'package:flutter/material.dart';
import 'package:spyke/utility/constants.dart';
import 'package:spyke/widgets/custom_box_img.dart';

class CustomBoxImgCarousel extends StatelessWidget {
  final List<String> urls;
  final ValueChanged? onClicked;
  final double? height;
  final double? width;
  final double? cornerRadius;

  const CustomBoxImgCarousel(
      {Key? key,
      required this.urls,
      this.onClicked,
      this.height,
      this.width,
      this.cornerRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: urls.length,
          itemExtent: 90,
          itemBuilder: ((context, index) => CustomBoxImage(
                url: urls[index],
                height: height,
                width: width,
                cornerRadius: cornerRadius,
              )),
        ),
      ),
    );
  }
}
