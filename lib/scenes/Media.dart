import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spyke/utility/constants.dart';

class Media extends StatelessWidget {
  final String title;
  final List<String>? photos;
  final List<String>? links;
  final List<String>? videos;
  final List<String>? documents;
  final List<String>? locations;

  const Media(
      {Key? key,
      required this.title,
      this.photos,
      this.links,
      this.videos,
      this.documents,
      this.locations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            centerTitle: true,
            floating: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: customTitle(title: title),
              collapseMode: CollapseMode.pin,
              background: Image.network('https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80'),
              centerTitle: true,
            ),
          )
        ],
      ),
    );
  }
}
