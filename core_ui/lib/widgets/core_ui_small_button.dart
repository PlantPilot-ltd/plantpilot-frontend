part of '/core_ui.dart';

class CoreUiSmallButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final Color color;
  final Color? backgroundColor;
  final Color? borderColor;

  const CoreUiSmallButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    this.backgroundColor,
    this.borderColor,
  });

  const CoreUiSmallButton.outlined({
    super.key,
    required this.title,
    required this.onTap,
  })  : color = CoreUIColors.blue,
        backgroundColor = null,
        borderColor = CoreUIColors.blue;

  const CoreUiSmallButton.filledPrimary({
    super.key,
    required this.title,
    required this.onTap,
  })  : color = CoreUIColors.background,
        backgroundColor = CoreUIColors.primary,
        borderColor = null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: _BorderDecoration(
        borderColor: borderColor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              highlightColor: borderColor?.withValues(alpha: 0.1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: CoreUIFonts.sfUIText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BorderDecoration extends StatelessWidget {
  final Color? borderColor;
  final Widget child;

  const _BorderDecoration({
    this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (borderColor == null) return child;
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: [9, 6],
      strokeWidth: 2,
      color: borderColor!,
      child: child,
    );
  }
}
