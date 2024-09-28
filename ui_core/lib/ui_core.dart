library ui_core;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_core/localization/l10n/generated/app_localizations.dart';
import 'package:ui_core/localization/l10n/generated/app_localizations_en.dart';

export 'package:mobx/mobx.dart';

part 'localization/app_localization.dart';

part 'architecture/screen_architecture/vpd_architecture.dart';
part 'architecture/app_runner/app_runner_service_base.dart';
part 'architecture/app_runner/app_runner_widget.dart';

part 'theme/app_theme.dart';
part 'theme/app_theme_data.dart';
part 'theme/app_color_scheme.dart';

part 'directories/app_icons.dart';
part 'directories/app_images.dart';
part 'directories/app_colors.dart';
part 'directories/app_material_app_themes.dart';
