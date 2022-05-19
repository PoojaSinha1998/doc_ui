import 'package:doc_app/widgets/widget_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.maxLines,
    this.minLines,
    this.prefixText,
    this.controller,
    this.text,
    this.maxLength,
    this.obsecureText,
    this.contentPading,
    this.newTextField = false,
    this.height,
    this.width,
    this.hintText,
    this.titleStyle,
    this.readOnly = false,
    required this.onChanged,
    this.onSubmit,
    this.textCapitalization = TextCapitalization.sentences,
    this.whichTextfield,
    this.textInputAction,
    this.labelText,
    this.keyboardType = TextInputType.name,
    this.autoFocus = false,
    this.length,
    this.onTap,
    this.bgColor,
    this.textAlign = TextAlign.center,
    this.borderRadius,
    this.prefixIcon,
    this.shadow,
  }) : super(key: key);

  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Color? bgColor;
  final String? prefixText;
  final TextEditingController? controller;
  final String? text;
  final String? hintText;
  final bool? obsecureText;
  final EdgeInsetsGeometry? contentPading;
  final bool newTextField;
  final double? height;
  final double? width;
  final TextStyle? titleStyle;
  final bool? whichTextfield;
  final bool readOnly;
  final Function(String) onChanged;
  final Function(String)? onSubmit;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? labelText;
  final int? length;
  final TextInputType keyboardType;
  final bool autoFocus;
  final TextAlign textAlign;
  final Function()? onTap;
  final Widget? prefixIcon;
  final BorderRadiusGeometry? borderRadius;
  final bool? shadow;

  @override
  _TextFieldProfileEditState createState() => _TextFieldProfileEditState();
}

class _TextFieldProfileEditState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller!.text = widget.text!;
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller!.text = widget.text!;
    }
  }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //     widget.controller.text = widget.text;

  // }

  @override
  Widget build(BuildContext context) {
    return widget.newTextField ? IntrinsicWidth(
      child:
      TextField(
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        showCursor: false,
        autofocus: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength ?? 30),
        ],
        onChanged: (v) => widget.onChanged(v),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        controller: widget.controller ?? TextEditingController(),
        textAlign: TextAlign.center,
        // style: widget.titleStyle ??
        //     Get.textTheme.headline1
        //         .copyWith(color: cBlack, fontSize: 30),
        decoration: InputDecoration(
            border: InputBorder.none,
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: cPrimary, width: 2.0),
            // ),
            hintText: widget.hintText ?? ''),
      ),
    )
        : WidgetShadow(
      height: widget.height ?? 46,
      width: widget.width,
      shadow: widget.shadow,
      color: widget.bgColor,
      borderRadius: widget.borderRadius,
      child: Row(
        children: [
          if (widget.prefixIcon != null)
            Row(
              children: [
                const SizedBox(width: 15),
                widget.prefixIcon!,
                const SizedBox(width: 15),
                Center(
                  child: Container(
                    width: 0.5,
                    color: CustomColors.cWhite,
                  ),
                )
              ],
            ),
          Flexible(
            child: TextField(
              keyboardType: widget.keyboardType,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.length ?? -1),
              ],
              autofocus: widget.autoFocus,
              onSubmitted: (val) => widget.onSubmit!(val),
              onChanged: (val) => widget.onChanged(val),
              decoration: InputDecoration(
                //  suffixIcon: const Icon(Icons.search),
                hintText: widget.hintText ?? '',
                hintStyle: TextStyle(color: Colors.grey),
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: widget.contentPading ??
                    const EdgeInsets.symmetric(horizontal: 10),

                prefixText: widget.prefixText,
              ),
              minLines: widget.minLines ?? 1,
              maxLines: widget.maxLines ?? 1,
              controller: widget.controller ?? TextEditingController(),
              maxLength: widget.maxLength,
              obscureText: widget.obsecureText ?? false,
              textCapitalization: widget.textCapitalization,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              textInputAction:
              widget.textInputAction ?? TextInputAction.next,
              onTap: widget.onTap,
            ),
          ),
        ],
      ),
    );
  }
}
