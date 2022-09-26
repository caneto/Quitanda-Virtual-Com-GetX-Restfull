import 'package:flutter/material.dart';
import 'package:quitandavirtual/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryTile({Key ? key, required this.category, required this.isSelected, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? CustomColors.customSwatchColor : Colors.transparent
          ),
          child: Text(category, style: TextStyle(
              color: isSelected ? Colors.white : CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? 16 : 14
            ),
          ),
        ),
      ),
    );
  }
}
