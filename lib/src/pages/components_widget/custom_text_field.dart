import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSave;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatter,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.onSave,
    this.validator,
    this.textInputType
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatter,
          obscureText: isObscure,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          onSaved: widget.onSave,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  )
                : null,
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          )),
    );
  }
}
