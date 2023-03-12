import 'package:flutter/material.dart';
import 'package:vidyutrenz_app/constants/colors.dart';

class TitleWidget extends StatelessWidget {
  final String img;
  final String title;
  final String desc;
  final Color color;
  const TitleWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.desc,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
          child: Image.asset(
            img,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                color: colors.lightColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
