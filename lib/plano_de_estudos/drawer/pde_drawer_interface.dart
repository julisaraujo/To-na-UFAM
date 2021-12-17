import 'package:flutter/material.dart';
import 'package:to_na_ufam/plano_de_estudos/drawer/pde_drawer.dart';

class PDEDrawerInterface extends StatelessWidget {

  final PageController pageController;

  PDEDrawerInterface(this.pageController);

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 50,
        child: ListView(
          children: [
            SizedBox(
              height: 56,
            ),
            PDEDrawer("S", pageController, 0),
            PDEDrawer("T", pageController, 1),
            PDEDrawer("Q", pageController, 2),
            PDEDrawer("Q", pageController, 3),
            PDEDrawer("S", pageController, 4),
            PDEDrawer("S", pageController, 5),
            PDEDrawer("D", pageController, 6),
          ],
        ),
      );
  }
}
