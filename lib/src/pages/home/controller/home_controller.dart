import 'package:get/get.dart';
import 'package:quitandavirtual/src/models/category_model.dart';
import 'package:quitandavirtual/src/models/item_model.dart';
import 'package:quitandavirtual/src/pages/home/repository/home_repository.dart';
import 'package:quitandavirtual/src/pages/home/result/home_result.dart';
import 'package:quitandavirtual/src/utils/utils_services.dart';

class HomeController extends GetxController {
  final homeRespository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  @override
  void onInit() {
    super.onInit();

    getAllCategories();
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    //if (currentCategory!.items.isNotEmpty) return;

    //getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult = await homeRespository.getAllCategories();

    setLoading(false);
    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;

        selectCategory(allCategories.first);
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