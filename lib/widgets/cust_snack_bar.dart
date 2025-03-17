import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


void showSnackBar({ContentType contentType = ContentType.failure,required BuildContext context,required String title,required String message}){
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}


void showTopSnackBar({ContentType contentType = ContentType.failure, required BuildContext context, required String title, required String message}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: AwesomeSnackbarContent(
                title: title,
                message: message,
                contentType: contentType,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}