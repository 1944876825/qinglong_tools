import 'package:flutter/material.dart';
import 'package:qinglong_tools/model/work_model.dart';

import '../http/core/http.dart';
import '../http/request/work_request.dart';
import 'base_model.dart';

class CronSearchModel with ChangeNotifier {
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

  void update(CronSearchModel cronSearchData) {
    data = cronSearchData.data;
    total = cronSearchData.total;
    notifyListeners();
  }

  void getCronSearchData() {
    try {
      CronSearch cronSearch = CronSearch();
      cronSearch
          .addParams('searchValue', '')
          .addParams('page', 1)
          .addParams('size', 20);
      Http.getInstance().fire(cronSearch).then((res) {
        CronSearchModel cron = CronSearchModel.fromJson(res);
        debugPrint(cron.total.toString());
        if (cron.total > 0) {
          update(cron);
        }
      });
    } catch (e) {
      debugPrint("_getWorkData error $e");
    }
  }
}
