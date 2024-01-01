import 'package:flutter/material.dart';
import 'package:qinglong_tools/http/request/work_request.dart';
import 'package:qinglong_tools/model/base_model.dart';

import '../http/core/http.dart';

class WorkLog extends StatefulWidget {
  final int commandIndex;
  const WorkLog({super.key, required this.commandIndex});

  @override
  State<WorkLog> createState() => _WorkLogState();
}

class _WorkLogState extends State<WorkLog> {
  String logText = '';
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0, // 初始滚动位置
      keepScrollOffset: true,
    );
    // _scrollController.addListener(() {
    //   debugPrint('111');
    // });
    _getCronLog();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            '日志',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Text(
                logText,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _getCronLog() {
    CronLog cronLog = CronLog();
    cronLog.pathParams = '${widget.commandIndex}/log';
    Http.getInstance().fire(cronLog).then((value) {
      BaseModel baseModel = BaseModel.fromJson(value);
      if (baseModel.code == 200) {
        setState(() {
          logText = baseModel.data.toString();
        });
        if (!logText.contains('执行结束')) {
          Future.delayed(const Duration(seconds: 1), () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
          Future.delayed(const Duration(seconds: 1), _getCronLog);
        }
      }
    });
  }
}
