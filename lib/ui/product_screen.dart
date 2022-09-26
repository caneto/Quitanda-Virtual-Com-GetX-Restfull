import 'package:flutter/material.dart';
import 'package:quitandavirtual/components/quantity_widget.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/models/item_model.dart';
import 'package:quitandavirtual/utils/utils_services.dart';

class ProductScreen extends StatefulWidget {
  final ItemModel item;

  ProductScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child:
                  Hero(
                    tag: widget.item.imgUrl,
                    child: Image.asset(widget.item.imgUrl),
                  )
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade600, offset: Offset(0, 2))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.itemName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                        QuantityWidget(
                          suffixText: widget.item.unit,
                          value: cartItemQuantity,
                          result: (quantity) {
                            setState((){
                              cartItemQuantity = quantity;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      utilsServices.priceToCurrency(widget.item.price),
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
                        label: const Text(
                          'Add no Carrinho',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        icon: const Icon(
                          Icons.shopping_cart_checkout_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios),
            )),
          )
        ],
      ),
    );
  }
}
