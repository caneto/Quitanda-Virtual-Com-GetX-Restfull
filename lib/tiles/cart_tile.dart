import 'package:flutter/material.dart';
import 'package:quitandavirtual/components/quantity_widget.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/models/cart_item_model.dart';
import 'package:quitandavirtual/utils/utils_services.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    Key? key,
    required this.cartItemModel,
    required this.remove,
  }) : super(key: key);

  final CartItemModel cartItemModel;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          widget.cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItemModel.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItemModel.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: QuantityWidget(
          suffixText: widget.cartItemModel.item.unit,
          value: widget.cartItemModel.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItemModel.quantity = quantity;
              print(quantity);
              if (quantity == 0) {
                widget.remove(widget.cartItemModel);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
