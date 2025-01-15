part of '/core_ui.dart';

class CoreUiIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  final double size;
  final Color? color;
  final Color iconColor;

  const CoreUiIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.size,
    required this.color,
    required this.iconColor,
  });

  const CoreUiIconButton.appBar({
    super.key,
    required this.icon,
    required this.onTap,
  })  : size = 46,
        iconColor = CoreUIColors.text,
        color = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.34),
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor,
                  size: size * 0.6,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
