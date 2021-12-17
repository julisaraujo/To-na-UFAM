import 'package:flutter/material.dart';

class PDEDrawer extends StatelessWidget {

  final String text;
  final PageController controller;
  final int page;

  PDEDrawer(this.text,this.controller,this.page);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Material(
        elevation: 7.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          },
          child: Container(
            width: 50,
            height: 80,
            decoration: BoxDecoration(
              color: controller.page.round() == page ?
              Colors.white38 : Color.fromARGB(250, 28, 33, 33),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: controller.page.round() == page ?
                     Colors.black : Colors.white,
                    fontSize: 30),
              ),
            ),
          ),
        )
      ),
    );
  }
}
