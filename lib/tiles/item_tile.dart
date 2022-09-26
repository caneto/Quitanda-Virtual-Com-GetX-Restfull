import 'package:flutter/material.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/models/item_model.dart';
import 'package:quitandavirtual/ui/product_screen.dart';
import 'package:quitandavirtual/utils/utils_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  ItemTile({
    Key? key,
    required this.item,
    required this.cartAnimationMethod,
  }) : super(key: key);


  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  UtilsServices utils = UtilsServices();

  final GlobalKey imageGk = GlobalKey();

  IconData tileIcon = Icons.add_shopping_cart_outlined;
  //Icons.shopping_bag_outlined,

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: widget.item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: widget.item.imgUrl,
                    child: Image.asset(
                      widget.item.imgUrl,
                      key: imageGk,
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utils.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
           borderRadius: const BorderRadius.only(
             bottomLeft: Radius.circular(15),
             topRight: Radius.circular(20)
           ),
           child: Material (
              child: InkWell(
                onTap: () {
                  switchIcon();

                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 48,
                  width: 35,
                  decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
         )
       ],
    );
  }
}
