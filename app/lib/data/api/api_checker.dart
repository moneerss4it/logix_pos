
import 'package:get/get.dart';
import 'package:app/view/widget/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {

      // Get.find<AuthController>().clearSharedData();
      // Get.find<WishListController>().removeWishes();
      // Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    }else {
    showCustomSnackBar(response.statusText.toString());
    }
  }
}
