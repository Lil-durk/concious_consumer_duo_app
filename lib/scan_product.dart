import 'package:flutter/material.dart';
import 'package:native_barcode_scanner/barcode_scanner.dart';

enum CameraActions {
  flipCamera,
  toggleFlashlight,
}

class ScanProductPage extends StatefulWidget {
  const ScanProductPage({super.key});

  @override
  State<ScanProductPage> createState() => _ScanProductPageState();
}

class _ScanProductPageState extends State<ScanProductPage> {
  bool withOverlay = true;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product scanner'), actions: [
          PopupMenuButton<CameraActions>(
            onSelected: (CameraActions result) {
              switch (result) {
                case CameraActions.flipCamera:
                  BarcodeScanner.flipCamera();
                  break;
                case CameraActions.toggleFlashlight:
                  BarcodeScanner.toggleFlashlight();
                  break;
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<CameraActions>>[
              const PopupMenuItem<CameraActions>(
                value: CameraActions.flipCamera,
                child: Text('Flip camera'),
              ),
              const PopupMenuItem<CameraActions>(
                value: CameraActions.toggleFlashlight,
                child: Text('Toggle flashlight'),
              ),
            ],
          ),
        ]),
        body: Builder(builder: (builderContext) {
          Widget child = BarcodeScannerWidget(
            scannerType: ScannerType.barcode,
            onBarcodeDetected: (barcode) async {
              await showDialog(
                  context: builderContext,
                  builder: (dialogContext) {
                    return Align(
                        alignment: Alignment.center,
                        child: Card(
                            margin: const EdgeInsets.all(24),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('barcode : ${barcode.value}'),
                                      Text('format : ${barcode.format.name}'),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pop(dialogContext);
                                          Navigator.pushNamed(
                                              context, '/product_details');
                                        },
                                        child: const Text('View Details'),
                                      ),
                                    ]))));
                  });
              await BarcodeScanner.stopScanner();
              setState(() => isScanning = false);
            },
            onTextDetected: (String text) async {
              await showDialog(
                  context: builderContext,
                  builder: (dialogContext) {
                    return Align(
                        alignment: Alignment.center,
                        child: Card(
                            margin: const EdgeInsets.all(24),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('text : \n$text'),
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(dialogContext),
                                          child: const Text('Close dialog'))
                                    ]))));
                  });
            },
            onError: (dynamic error) {
              debugPrint('$error');
            },
          );

          if (withOverlay) {
            child = buildWithOverlay(builderContext, child);
          }

          return child;
        }));
  }

  buildWithOverlay(BuildContext builderContext, Widget scannerWidget) {
    return Stack(children: [
      Positioned.fill(child: scannerWidget),
      Align(
          alignment: Alignment.center,
          child: Divider(color: Colors.red[400], thickness: 0.8)),
      Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 64),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15)))),
      Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () async {
            if (isScanning) {
              await BarcodeScanner.stopScanner();
            } else {
              await BarcodeScanner.startScanner();
            }
            setState(() => isScanning = !isScanning);
          },
          child: Icon(
            isScanning ? Icons.stop : Icons.camera_alt, // Change icon
          ),
        ),
      ),
    ]);
  }
}
