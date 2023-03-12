import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/constants/colors.dart';
import 'package:vidyutrenz_app/controller/unseen_msg_controller.dart';

class EventBox extends StatefulWidget {
  final Size size;
  final String img;
  final String name;
  final String desc;
  final Widget page;
  final Color color;
  final int index;
  EventBox({
    Key? key,
    required this.size,
    required this.img,
    required this.name,
    required this.desc,
    required this.page,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  UnseenMsgController unseenMsgController = Get.put(UnseenMsgController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
      "Unseen value in the initstate of the HomePage " + unseenMsgController.Unseen.value.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          widget.page,
          transition: Transition.native,
          duration: Duration(milliseconds: 600),
        );
      },
      child: Container(
        height: 150,
        width: widget.size.width,
        padding: const EdgeInsets.only(
          left: 16,
          top: 12,
          right: 14,
          bottom: 12,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colors.containerColor, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ]),
        child: widget.index != 2
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.color,
                    ),
                    child: Image.asset(
                      widget.img,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.desc,
                    style: TextStyle(
                      color: colors.lightColor,
                      fontSize: 12,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                          widget.page,
                          transition: Transition.native,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                      child: Image.asset('assets/for_arrow.png'),
                    )
                  ]),
                ],
              )
            : Obx(
                () => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: widget.color,
                          ),
                          child: Image.asset(
                            widget.img,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                            color: colors.lightColor,
                            fontSize: 12,
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                widget.page,
                                transition: Transition.native,
                                duration: Duration(milliseconds: 600),
                              );
                            },
                            child: Image.asset('assets/for_arrow.png'),
                          )
                        ]),
                      ],
                    ),
                    unseenMsgController.Unseen.value != 0
                        ? Positioned(
                            top: -10,
                            left: 40,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                unseenMsgController.Unseen.value.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
      ),
    );
  }
}
