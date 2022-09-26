import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quitandavirtual/components/app_name_widget.dart';
import 'package:quitandavirtual/config/app_data.dart' as appData;
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/tiles/category_tile.dart';
import 'package:quitandavirtual/tiles/item_tile.dart';
import 'package:quitandavirtual/utils/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: Text(
                  "0",
                  style: TextStyle(
                      color: CustomColors.customWhiteColor, fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: 'Pesquise aqui',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.customContrastColor,
                      size: 21,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none))),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: appData.categories.length,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: appData.categories[index],
                    isSelected: appData.categories[index] == selectCategory,
                    onPressed: () {
                      setState(() {
                        selectCategory = appData.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                  //childAspectRatio:
                ),
                itemCount: appData.items.length,
                itemBuilder: (_,index) {
                  return ItemTile(
                    item: appData.items[index],
                    cartAnimationMethod: itemSelectedCartAnimations
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
