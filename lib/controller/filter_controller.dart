import 'package:get/get.dart';

import '../model/filter_model.dart';
import '../model/json.dart';

class FiterController extends GetxController {
  var isSelected = false.obs;
  var loading = false.obs;
  RxList<Filtter> allDriversList = <Filtter>[].obs;
  RxList<String> selectedItems = <String>[].obs;

  Future<List<Filtter>?> getFilter() async {
    update();
    FilterModel filterModel = FilterModel.fromJson(jsonData);

    loading.value = false;
    update();
    allDriversList.value = filterModel.data!;
    return allDriversList;
  }

  @override
  void onInit() {
    super.onInit();
    getFilter();
    update();
  }
}
