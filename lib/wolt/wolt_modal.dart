import 'package:flutter/material.dart';

import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class WoltModal extends StatelessWidget {
  const WoltModal({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);

    WoltModalSheetPage page1(BuildContext modalSheetContext) {
      return WoltModalSheetPage.withSingleChild(
        stickyActionBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(modalSheetContext).pop(),
                child: const SizedBox(
                  height: 56.0,
                  width: double.infinity,
                  child: Center(child: Text('Cancel')),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () =>
                    pageIndexNotifier.value = pageIndexNotifier.value + 1,
                child: const SizedBox(
                  height: 56.0,
                  width: double.infinity,
                  child: Center(child: Text('Next page')),
                ),
              ),
            ],
          ),
        ),
        isTopBarLayerAlwaysVisible: true,
        topBarTitle:
            Text('Pagination', style: Theme.of(context).textTheme.titleSmall),
        trailingNavBarWidget: IconButton(
          padding: const EdgeInsets.all(16),
          icon: const Icon(Icons.close),
          onPressed: Navigator.of(modalSheetContext).pop,
        ),
        child: const Padding(
            padding: EdgeInsets.only(bottom: 150),
            child: Text(
              '''
Pagination involves a sequence of screens the user navigates sequentially. We chose a lateral motion for these transitions. When proceeding forward, the next screen emerges from the right; moving backward, the screen reverts to its original position. We felt that sliding the next screen entirely from the right could be overly distracting. As a result, we decided to move and fade in the next page using 30% of the modal side.
''',
            )),
      );
    }

    WoltModalSheetPage page2(BuildContext modalSheetContext) {
      return WoltModalSheetPage.withCustomSliverList(
        mainContentPadding: EdgeInsetsDirectional.zero,
        stickyActionBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(modalSheetContext).pop();
              pageIndexNotifier.value = 0;
            },
            child: const SizedBox(
              height: 56.0,
              width: double.infinity,
              child: Center(child: Text('Close')),
            ),
          ),
        ),
        pageTitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Material Colors',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        heroImageHeight: 200,
        heroImage: const Image(
          image: AssetImage('assets/images/material_colors_hero.png'),
          fit: BoxFit.cover,
        ),
        leadingNavBarWidget: IconButton(
          padding: const EdgeInsets.all(16),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () =>
              pageIndexNotifier.value = pageIndexNotifier.value - 1,
        ),
        trailingNavBarWidget: IconButton(
          padding: const EdgeInsets.all(16),
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(modalSheetContext).pop();
            pageIndexNotifier.value = 0;
          },
        ),
        sliverList: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => ColorTile(color: allMaterialColors[index]),
            childCount: allMaterialColors.length,
          ),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xFF009DE0), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    WoltModalSheet.show<void>(
                      pageIndexNotifier: pageIndexNotifier,
                      context: context,
                      pageListBuilder: (modalSheetContext) {
                        return [
                          page1(modalSheetContext),
                          page2(modalSheetContext),
                        ];
                      },
                      modalTypeBuilder: (context) {
                        final size = MediaQuery.of(context).size.width;
                        if (size < 768) {
                          return WoltModalType.bottomSheet;
                        } else {
                          return WoltModalType.dialog;
                        }
                      },
                      onModalDismissedWithBarrierTap: () {
                        debugPrint('Closed modal sheet with barrier tap');
                        Navigator.of(context).pop();
                        pageIndexNotifier.value = 0;
                      },
                      maxDialogWidth: 560,
                      minDialogWidth: 400,
                      minPageHeight: 0.4,
                      maxPageHeight: 0.9,
                    );
                  },
                  child: const SizedBox(
                    height: 56.0,
                    child: Center(child: Text('Show Modal Sheet')),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final Color color;

  const ColorTile({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Center(
        child: Text(
          color.toString(),
          style: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<Color> get allMaterialColors {
  List<Color> allMaterialColorsWithShades = [];

  for (MaterialColor color in Colors.primaries) {
    allMaterialColorsWithShades.add(color.shade100);
    allMaterialColorsWithShades.add(color.shade200);
    allMaterialColorsWithShades.add(color.shade300);
    allMaterialColorsWithShades.add(color.shade400);
    allMaterialColorsWithShades.add(color.shade500);
    allMaterialColorsWithShades.add(color.shade600);
    allMaterialColorsWithShades.add(color.shade700);
    allMaterialColorsWithShades.add(color.shade800);
    allMaterialColorsWithShades.add(color.shade900);
  }
  return allMaterialColorsWithShades;
}
