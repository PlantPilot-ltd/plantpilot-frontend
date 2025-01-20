part of '/core_ui.dart';

class CoreUiSmallInfoBlock extends StatelessWidget {
  final String? _text;
  final IconData _icon;
  final Color _iconColor;
  final Color? _textColor;
  final Color _backgroundColor;
  final Color _borderColor;

  final VoidCallback? onTap;

  const CoreUiSmallInfoBlock.bluetooth({
    super.key,
    this.onTap,
  })  : _text = 'BT',
        _icon = CoreUIIcons.bluetooth,
        _iconColor = CoreUIColors.blue,
        _textColor = CoreUIColors.blue,
        _backgroundColor = CoreUIColors.background80,
        _borderColor = CoreUIColors.background80;

  const CoreUiSmallInfoBlock.bluetoothSignal({
    super.key,
    required int signalRssi,
    this.onTap,
  })  : _text = '$signalRssi mH',
        _icon = CoreUIIcons.connectionStatus,
        _iconColor = CoreUIColors.blue,
        _textColor = CoreUIColors.text,
        _backgroundColor = CoreUIColors.background80,
        _borderColor = CoreUIColors.background80;

  const CoreUiSmallInfoBlock.himidity({
    super.key,
    required int himidity,
    this.onTap,
  })  : _text = '$himidity%',
        _icon = CoreUIIcons.humidity,
        _iconColor = CoreUIColors.blue,
        _textColor = CoreUIColors.text,
        _backgroundColor = CoreUIColors.background80,
        _borderColor = CoreUIColors.background80;

  const CoreUiSmallInfoBlock.temperature({
    super.key,
    required int temperature,
    this.onTap,
  })  : _text = '$temperature°C',
        _icon = CoreUIIcons.temperature,
        _iconColor = CoreUIColors.red,
        _textColor = CoreUIColors.text,
        _backgroundColor = CoreUIColors.background80,
        _borderColor = CoreUIColors.background80;

  const CoreUiSmallInfoBlock.light({
    super.key,
    required int light,
    this.onTap,
  })  : _text = '$light%',
        _icon = CoreUIIcons.sun,
        _iconColor = CoreUIColors.yellow,
        _textColor = CoreUIColors.text,
        _backgroundColor = CoreUIColors.background80,
        _borderColor = CoreUIColors.background80;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: 56,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.fromBorderSide(BorderSide(color: _borderColor)),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(_icon, size: 27, color: _iconColor),
                      if (_text != null)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                _text,
                                maxLines: 1,
                                style: TextStyle(
                                  color: _textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
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
