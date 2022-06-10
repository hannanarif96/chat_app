import 'package:get/get.dart';

void handleResponseErrors(int statusCode) {
  switch (statusCode) {
    case 400:
      Get.snackbar("Error", "User does not exist, please retry");
      break;
    case 401:
      Get.snackbar("Error", "Session expired, please login again");
      break;
    case 403:
      Get.snackbar("Error", "Access to this resource is forbidden");
      break;
    case 404:
      Get.snackbar("Error", "Resource not found, please retry");
      break;
    case 405:
      Get.snackbar("Error", "Method not allowed, please retry");
      break;
    case 408:
      Get.snackbar("Error", "An unexpected timeout occurred, please retry");
      break;
    case 409:
      Get.snackbar("Error", "A conflict occurred, please retry");
      break;
    case 415:
      Get.snackbar("Error", "Unsupported media type, please retry");
      break;
    case 500:
      Get.snackbar(
          "Error", "An internal error occurred on the server, please retry");
      break;
    default:
      Get.snackbar("Error", "An unexpected error occurred");
      break;
  }
}
