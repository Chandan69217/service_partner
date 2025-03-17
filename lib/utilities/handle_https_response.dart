import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../screens/authentication/login_screen.dart';
import '../widgets/cust_snack_bar.dart';
// import 'consts.dart';

Future<Map<String, dynamic>> handleHttpResponse(BuildContext context,Response response) async {
  String errorTitle = 'Error';
  String errorDesc = 'Please retry after sometime';
  ContentType type = ContentType.failure;

  switch (response.statusCode) {
    case 400:
      errorTitle = 'Invalid username or email address';
      errorDesc = 'Please check your username & password.';
      type = ContentType.warning;
      break;
    case 401:
      errorTitle = 'Unauthorized';
      errorDesc = 'Session expired or you are not authorized. Please log in again.';
      type = ContentType.warning;
      break;
    case 403:
      errorTitle = 'Forbidden';
      errorDesc = 'You do not have permission to access this resource.';
      type = ContentType.failure;
      break;
    case 404:
      errorTitle = 'Not Found';
      errorDesc = 'The requested resource could not be found.';
      type = ContentType.failure;
      break;
    case 500:
      errorTitle = 'Server Error';
      errorDesc = 'Something went wrong on the server. Please login again.';
      type = ContentType.warning;
      // Pref.instance.remove(Consts.isLogin);
      // Pref.instance.remove(Consts.teacherToken);
      // Pref.instance.remove(Consts.organisationId);
      // Pref.instance.remove(Consts.organisationCode);
      // Pref.instance.remove(Consts.teacherCode);
      // Pref.instance.remove(Consts.userProfile);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
      type = ContentType.failure;
      break;
    case 502:
      errorTitle = 'Bad Gateway';
      errorDesc = 'The server received an invalid response from an upstream server.';
      break;
    case 503:
      errorTitle = 'Service Unavailable';
      errorDesc = 'The server is temporarily unavailable. Please try again later.';
      break;
    default:
      errorDesc = 'An unexpected error occurred. Please try again later.';
      break;
  }

  showSnackBar(context: context, title: errorTitle, message: errorDesc,contentType: type);

  return {
    'title': errorTitle,
    'desc': errorDesc,
  };
}