import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qinglong_tools/model/cron_search_model.dart';

import '../../model/work_model.dart';

class WorkController extends GetxController {
  CronSearchModel cronSearchModel = CronSearchModel();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  CronSearchModel cronSearchData = Get.put(CronSearchModel());
  List<WorkModel> workData = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCronSearchData();
  }

  void smartRefresh() async {
    await getCronSearchData();
    refreshController.refreshCompleted();
  }

  Future<void> getCronSearchData() async {
    cronSearchData.clear();
    await cronSearchData.getCronSearchData();
  }
}
