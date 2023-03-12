import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../constants/colors.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/widgets/imageLoader-gallery.dart';
import 'package:vidyutrenz_app/widgets/titles.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List images = [];
  Future<void> getImages() async {
    var url = Uri.parse('https://vidyutrenz-backend.onrender.com/images');
    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      var imagesRes = jsonDecode(response.body);
      setState(() {
        images = imagesRes['images'];
      });
      print("IMAGES");
      // print(images);
    } on Exception catch (e) {
      // TODO
      print("Faled to fetch the images " + e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: colors.lightColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            TitleWidget(
              img: 'assets/gallery_1.png',
              title: 'GALLERY',
              desc: 'Explore our memorable moments',
              color: Color(0xFFFFC242),
            ),
            SizedBox(
              height: 20,
            ),
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageLoaderGallery(
                  index: index,
                  images: images,
                );
              },
            ),
            //
          ]),
        ),
      ),
    );
  }
}
