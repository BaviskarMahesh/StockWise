import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String? scannedCode;
  bool isScannerActive = false;
  final MobileScannerController _controller = MobileScannerController();

  Future<void> requestCameraPermissionAndStartScanner() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      setState(() {
        scannedCode = null;
        isScannerActive = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Camera permission is required")),
      );
    }
  }

  void handleDetection(String code) {
    setState(() {
      scannedCode = code;
      isScannerActive = false;
    });
    _controller.stop(); // Stop camera after scan
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
        backgroundColor: const Color(0xff7871F8),
      ),
      body: Stack(
        children: [
          if (isScannerActive)
            MobileScanner(
              controller: _controller,
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                if (barcodes.isNotEmpty) {
                  final String? code = barcodes.first.rawValue;

                  if (code != null && code != scannedCode) {
                    handleDetection(code);
                  }
                }
              },
            )
          else if (scannedCode != null)
            // Show scanned result
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xff7871F8), width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        size: 60, color: Colors.green),
                    const SizedBox(height: 12),
                    const Text(
                      "Scanned Successfully!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Font1'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      scannedCode!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Font1',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          else
            const Center(
              child: Text(
                'Tap the button below to start scanning.',
                style: TextStyle(fontSize: 16, fontFamily: 'Font1'),
              ),
            ),

          // Optional: Scanning overlay while scanning
          if (isScannerActive)
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: !isScannerActive
          ? FloatingActionButton.extended(
              onPressed: requestCameraPermissionAndStartScanner,
              backgroundColor: const Color(0xff7871F8),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Start Scan"),
            )
          : null,
    );
  }
}
