import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qinglong_tools/model/cron_search_model.dart';
import 'package:qinglong_tools/pages/work/work_controller.dart';

import '../../widget/work_card.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  WorkController workController = Get.put(WorkController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          '定时任务',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/add_work');
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: GetBuilder<CronSearchModel>(
          builder: (model) {
            return SmartRefresher(
              controller: workController.refreshController,
              onRefresh: workController.smartRefresh,
              child: ListView.builder(
                itemCount: model.total,
                itemBuilder: (BuildContext context, int index) {
                  return WorkCard(workData: model.data![index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
