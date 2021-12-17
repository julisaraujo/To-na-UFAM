import 'package:flutter/material.dart';

class DrawerInterface extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerInterface(this.icon, this.text, this.controller,this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
          ),
          child: InkWell(
            onTap: (){
              Navigator.of(context).pop();
              controller.jumpToPage(page);
            },
            child: Container(
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                ),
                color: controller.page.round() == page ?
                Color.fromARGB(10, 218, 221, 224) : Colors.transparent,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Material(
                      color: Colors.transparent,
                      child: Icon(
                        icon,
                        size: 22,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
