import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:service_partner/widgets/custom_button.dart';
import 'package:service_partner/widgets/custom_textfield.dart';

import '../utilities/cust_colors.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {

  bool showScanner = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Code'),
        backgroundColor:CustColors.yellow, // Yellow color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              // QR Code
              showScanner ? ScannerScreen()
              :Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: Image.asset(
                  'assets/logo/qr_logo.webp',
                  width: screenWidth * 0.55,
                  height: screenWidth * 0.55,
                ),
              ),

              // Scan Button
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: ()async {
                    if(await handleCameraPermission()){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScannerScreen()));
                    }
                    // if(!showScanner){
                    //   setState(() {
                    //     showScanner = !showScanner;
                    //   });
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.01)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Click here to scan a unique code',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          height: 1,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt,color: Colors.black,)),
                    ],
                  ),
                ),
              ),

              // "or" text
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Text(
                  'or',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),
                ),
              ),

              // Input Field for Code

              CustomFormTextField(hintText: 'Enter Code', prefixIcon: Icon(Icons.qr_code_scanner),radius: screenWidth * 0.01,),
              SizedBox(height: screenHeight * 0.08,),
              // Proceed Button
              CustomElevatedButton(text: 'Proceed', onPressed: (){}),

              SizedBox(height: screenHeight * 0.02,),
              // History Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: Colors.transparent,
                    overlayColor: Colors.transparent
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Go to unique code history'),
                      SizedBox(width: 10),
                      CircleAvatar(child: Icon(Icons.arrow_forward_rounded,color: Colors.black,),backgroundColor: CustColors.yellow,),
                    ],
                  ),
                ),
              ),


              // Help Section
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Need help?',style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 8.0,),
                    _buildContactItem(icon: Icons.phone, label: '9717500011'),
                    _buildContactItem(icon: Icons.email, label: 'info@vguardrishta.com'),
                    _buildContactItem(icon: FontAwesomeIcons.whatsapp, label: '9818900011'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildContactItem({required IconData icon,required String label}){
    return Row(
      children: [
        Icon(icon, color: CustColors.yellow),
        SizedBox(width: 10),
        Text(label),
      ],
    );
  }

  Future<bool> handleCameraPermission() async {
  
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted){
      return true;
    } else {
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        return true;
      } else if (newStatus.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Camera permission denied'))));
        return false;
      } else if (newStatus.isPermanentlyDenied) {
        openAppSettings();
        return false;
      }
      return false;
    }
  }
  
}






class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});
  @override
  State<ScannerScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<ScannerScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double zoom = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define font size based on screen size
    double titleFontSize = screenWidth * 0.05;
    double subTitleFontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await controller!.toggleFlash();
            setState(() {});
          },
          icon: FutureBuilder(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!
                    ? Icon(Icons.flash_on)
                    : Icon(Icons.flash_off);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await controller!.flipCamera();
              setState(() {});
            },
            icon: Icon(Icons.flip_camera_ios),
          )
        ],
        title: Text(
          'Scan',
          style: TextStyle(fontSize: titleFontSize),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.01),

                SizedBox(
                  width: screenWidth * 0.6,
                  child: RichText(
                    text: TextSpan(
                      text: 'Align the QR Code within the frame to scan',
                      style: TextStyle(fontSize: subTitleFontSize,color: Colors.black),
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                Expanded(child: _buildQrView(context)),
                SizedBox(height: screenHeight * 0.03),

                CustomElevatedButton(text: 'Cancel', onPressed: (){
                  Navigator.of(context).pop();
                },
                  elevation: 2,
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double scanArea = (screenWidth < 400 || MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: 20,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Map<String, dynamic> data = {
          'data': result!.code,
          'time': DateFormat('dd-mmm-yyyy  HH:mm').format(DateTime.now())
        };
        showDialogBox(context, result!);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void showDialogBox(BuildContext context, Barcode result) async {
    await controller?.pauseCamera();

    showGeneralDialog(
      context: context,
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Row(
              children: [
                SizedBox(width: 5.0),
                Text(result.format.name),
              ],
            ),
            content: Text(result.code.toString()),
            actions: [
              TextButton(
                onPressed: () async {
                  await controller?.resumeCamera();
                  Navigator.pop(buildContext);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
