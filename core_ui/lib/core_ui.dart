library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:mobx/mobx.dart';
export 'package:flutter_mobx/flutter_mobx.dart' hide version;
export 'localization/core_ui_localization.dart';

part 'theme/core_ui_theme.dart';
part 'theme/core_ui_theme_data.dart';
part 'theme/core_ui_color_scheme.dart';

part 'directories/core_ui_icons.dart';
part 'directories/core_ui_images.dart';
part 'directories/core_ui_colors.dart';
part 'directories/core_ui_themes.dart';
part 'directories/core_ui_fonts.dart';

part 'screen_architecture/vpd_architecture.dart';
