import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qinglong_tools/http/core/http_error.dart';
import 'package:qinglong_tools/model/work_model.dart';

import '../http/core/http.dart';
import '../http/request/work_request.dart';
import 'base_model.dart';

class CronSearchModel extends GetxController {
  List<WorkModel>? data;
  int total;

  CronSearchModel({this.data, this.total = 0});

  @override
  factory CronSearchModel.fromJson(Map item) {
    BaseModel baseModel = BaseModel.fromJson(item);
    List wm = baseModel.data['data'];
    // 调用自身构造方法传值并返回
    return CronSearchModel(
      data: wm.map((e) => WorkModel.fromJson(e)).toList(),
      total: baseModel.data['total'],
    );
  }

  void toUpdate(CronSearchModel cronSearchData) {
    data = cronSearchData.data;
    total = cronSearchData.total;
    update();
  }

  void clear() {
    total = 0;
    data?.clear();
    update();
  }

  Future<void> getCronSearchData() async {
    try {
      CronSearch cronSearch = CronSearch();
      cronSearch
          .addParams('searchValue', '')
          .addParams('page', 1)
          .addParams('size', 20);
      var value = await Http.getInstance().fire(cronSearch);
      if (value is NeedLogin) {
        return;
      }
      CronSearchModel cron = CronSearchModel.fromJson(value);
      debugPrint(cron.total.toString());
      if (cron.total > 0) {
        toUpdate(cron);
      }
    } catch (e) {
      debugPrint("_getWorkData error $e");
    }
  }
}
