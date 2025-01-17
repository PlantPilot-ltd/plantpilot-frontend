import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CoreUiEditableTextBox extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle textStyle;
  final int maxLines;
  final double iconSize;

  const CoreUiEditableTextBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.textStyle,
    required this.maxLines,
    required this.iconSize,
  });

  const CoreUiEditableTextBox.title({
    super.key,
    this.controller,
    this.focusNode,
  })  : iconSize = 40,
        maxLines = 1,
        textStyle = const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: CoreUIColors.text,
        );

  @override
  State<CoreUiEditableTextBox> createState() => _CoreUiEditableTextBoxState();
}

class _CoreUiEditableTextBoxState extends State<CoreUiEditableTextBox> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  void _onIconTap() => _focusNode.requestFocus();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AutoSizeTextField(
            controller: _controller,
            focusNode: _focusNode,
            scrollPadding: EdgeInsets.zero,
            minFontSize: (widget.textStyle.fontSize ?? 40) * 0.8,
            maxFontSize: widget.textStyle.fontSize ?? 40,
            style: widget.textStyle,
            maxLines: widget.maxLines,
            fullwidth: false,
            cursorColor: CoreUIColors.primary,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: _onIconTap,
          child: Icon(
            CoreUIIcons.edit,
            size: widget.iconSize,
            color: CoreUIColors.primary,
          ),
        ),
      ],
    );
  }
}
