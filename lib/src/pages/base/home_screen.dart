import 'package:flutter/material.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/cart/cart_tab.dart';
import 'package:quitandavirtual/src/pages/home/view/home_tab.dart';
import 'package:quitandavirtual/src/pages/orders/orders_tab.dart';
import 'package:quitandavirtual/src/pages/profile/profile_tab.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        onTap: (index) {
          setState(() {
            //pageController.jumpToPage(index);
            pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Carrinho'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Pedido'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.percent_outlined),
              label: 'Perfil'
          )

        ],
      ),
    );
  }
}
