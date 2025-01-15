part of '/core_ui.dart';

class CoreUiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const CoreUiAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: preferredSize.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: leading!,
                ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: CoreUIFonts.papillonUIText,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: CoreUIColors.text,
                  ),
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: trailing!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
