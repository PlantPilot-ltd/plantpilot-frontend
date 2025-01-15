library;

import 'dart:ui';

import 'package:core_ui/directories/core_ui_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

export 'package:mobx/mobx.dart';
export 'package:flutter_mobx/flutter_mobx.dart' hide version;
export 'localization/core_ui_localization.dart';
export 'directories/core_ui_icons.dart';

part 'directories/core_ui_images.dart';
part 'directories/core_ui_colors.dart';
part 'directories/core_ui_themes.dart';
part 'directories/core_ui_fonts.dart';

part 'screen_architecture/vpd_architecture.dart';

part 'widgets/core_ui_app_bar.dart';
part 'widgets/core_ui_icon_button.dart';
part 'widgets/core_ui_small_button.dart';
part 'widgets/core_ui_small_info_block.dart';
