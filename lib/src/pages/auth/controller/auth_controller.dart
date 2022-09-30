import 'package:get/get.dart';
import 'package:quitandavirtual/src/models/user_model.dart';
import 'package:quitandavirtual/src/pages/auth/repository/auth_repository.dart';
import 'package:quitandavirtual/src/pages/auth/result/auth_result.dart';
import 'package:quitandavirtual/src/pages_route/app_pages.dart';
import 'package:quitandavirtual/src/utils/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesRoutes.homeRoute);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
