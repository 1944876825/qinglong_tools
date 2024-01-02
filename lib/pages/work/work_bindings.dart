import 'package:get/get.dart';

import 'work_controller.dart';

class WorkBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkController>(
      () => WorkController(),
    );
  }
}
