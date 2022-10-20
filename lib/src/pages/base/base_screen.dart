import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/base/controller/navigation_controller.dart';
import 'package:quitandavirtual/src/pages/cart/view/cart_tab.dart';
import 'package:quitandavirtual/src/pages/home/view/home_tab.dart';
import 'package:quitandavirtual/src/pages/orders/view/orders_tab.dart';
import 'package:quitandavirtual/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      body: PageView(
        controller: navigationController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navigationController.currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        onTap: (index) {
          navigationController.navigatePageView(index);
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
      )),
    );
  }
}
