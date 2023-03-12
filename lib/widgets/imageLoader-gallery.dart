import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/constants/colors.dart';

class ImageLoaderGallery extends StatelessWidget {
  final int index;
  final List images;
  const ImageLoaderGallery({
    Key? key,
    required this.index,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colors.containerColor,
        ),
        child: InkWell(
          onTap: () {
            Get.to(
              ImageExpansion(
                imageUrl: images,
                index: index,
              ),
              transition: Transition.native,
              duration: Duration(milliseconds: 400),
            );
          },
          child: Hero(
            tag: images[index],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ImageExpansion extends StatefulWidget {
  final List imageUrl;
  final int index;
  const ImageExpansion({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  @override
  State<ImageExpansion> createState() => _ImageExpansionState();
}

class _ImageExpansionState extends State<ImageExpansion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgColor,
      body: GestureDetector(
        onVerticalDragDown: (details) {
          Get.back();
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors.containerColor,
            ),
            child: Hero(
              tag: widget.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.imageUrl[widget.index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
