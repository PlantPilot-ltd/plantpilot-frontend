import 'dart:math';

import 'package:app/presentation/index.dart';
import 'package:core_ui/widgets/core_ui_editable_text_box.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'package:app/presentation/screens/greenhouse_add/greenhouse_add_presenter.dart';
import 'package:app/presentation/screens/greenhouse_add/greenhouse_add_store.dart';

class GreenhouseAddScreen extends StatefulWidget {
  final GreenhouseAddDependencies dependencies;
  const GreenhouseAddScreen({super.key, required this.dependencies});
  @override
  _GreenhouseAddScreenState createState() => _GreenhouseAddScreenState();
}

class _GreenhouseAddScreenState
    extends VPDScreenState<GreenhouseAddScreen, GreenhouseAddPresenter> {
  GreenhouseAddStore get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = GreenhouseAddPresenter(widget.dependencies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final md = MediaQuery.of(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _AppBarDelegate(
              rssi: dataStore.scannedDevice?.rssi,
              onBackTap: presenter.onBackTap,
            ),
          ),
        ],
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                md.padding.bottom + 64 + 24,
              ),
              children: [
                /// Name title
                _TitleBlock(title: context.localization.ghAddSetName),
                const SizedBox(height: 12),

                /// Name value
                CoreUiEditableTextBox.title(
                  controller: presenter.nameController,
                ),
                const SizedBox(height: 24),

                /// Plants title
                Observer(
                  builder: (context) => _TitleBlock(
                    title: context.localization.ghAddSelectPlants,
                    subtitle: context.localization
                        .ghAddSelectedPlants(dataStore.selectedPlants.length),
                  ),
                ),
                const SizedBox(height: 6),

                /// Plants grid
                Observer(
                  builder: (context) {
                    final plants = dataStore.plants;
                    final selectedPlants = dataStore.selectedPlants;
                    return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.86,
                      ),
                      itemCount: plants.length,
                      itemBuilder: (context, index) {
                        final plant = plants[index];
                        if (selectedPlants.contains(plant)) {
                          return SmallPlantBlock.selected(
                            plant: plant,
                            onTap: () => dataStore.selectPlant(plant),
                          );
                        }
                        return SmallPlantBlock(
                          plant: dataStore.plants[index],
                          onTap: () =>
                              dataStore.selectPlant(dataStore.plants[index]),
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            /// Apply button
            Positioned(
              left: 24,
              right: 24,
              bottom: md.padding.bottom,
              child: CoreUiButton.filledPrimary(
                title: context.localization.ghAddSelectApply,
                onTap: presenter.onApplyTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleBlock extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _TitleBlock({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: CoreUIColors.secondaryText,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: title),
          if (subtitle != null)
            TextSpan(
              text: ' $subtitle',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
        ],
      ),
    );
  }
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  final int? rssi;
  final VoidCallback onBackTap;

  const _AppBarDelegate({
    required this.rssi,
    required this.onBackTap,
  });

  double get _topOffset => kToolbarHeight;

  @override
  double get minExtent => _topOffset + 56;

  @override
  double get maxExtent => _topOffset + 175;

  @override
  bool shouldRebuild(_AppBarDelegate oldDelegate) => rssi != oldDelegate.rssi;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final multiplier =
        min(max(1 - shrinkOffset / (maxExtent - minExtent), 0.0), 1.0);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CoreUIColors.secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(multiplier * 64),
        ),
      ),
      child: Stack(
        children: [
          /// Status blocks
          Positioned(
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: multiplier,
              child: Image.asset(
                AppImages.greenhousePlaceholder,
                width: MediaQuery.sizeOf(context).width * 0.7,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// Status blocks
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Opacity(
              opacity: multiplier,
              child: Row(
                children: [
                  if (rssi != null) ...[
                    CoreUiSmallInfoBlock.bluetoothSignal(signalRssi: rssi!),
                    const SizedBox(width: 16),
                  ],
                  const CoreUiSmallInfoBlock.bluetooth(),
                ],
              ),
            ),
          ),

          /// Back button
          Positioned(
            left: 24,
            top: _topOffset + 5,
            child: CoreUiIconButton.appBar(
              icon: CoreUIIcons.chevronBackwards,
              onTap: onBackTap,
            ),
          ),
        ],
      ),
    );
  }
}
