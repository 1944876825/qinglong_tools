import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qinglong_tools/widget/work_log.dart';

import '../http/core/http.dart';
import '../http/request/work_request.dart';
import '../model/base_model.dart';
import '../model/work_model.dart';

class ScriptControl extends StatefulWidget {
  final WorkModel workData;
  const ScriptControl({super.key, required this.workData});

  @override
  State<ScriptControl> createState() => _ScriptControlState();
}

class _ScriptControlState extends State<ScriptControl> {
  late List<WorkFunCardModel> _workFunCardData;
  @override
  void initState() {
    super.initState();
    _workFunCardData = [
      WorkFunCardModel(
        item: [
          WorkFunCardItemModel(
            '停止',
            Icon(
              Icons.stop_circle_outlined,
              size: 36,
              color: Colors.red[400],
            ),
          ),
          WorkFunCardItemModel(
            '运行',
            Icon(
              Icons.not_started_outlined,
              size: 36,
              color: Colors.green[400],
            ),
          ),
        ],
        status: widget.workData.status,
        action: () async {
          if (_workFunCardData[0].status == 1) {
            CronRun cronRun = CronRun();
            cronRun.setData('[${widget.workData.id}]');
            var value = await Http.getInstance().fire(cronRun);
            BaseModel baseModel = BaseModel.fromJson(value);
            if (baseModel.code == 200) {
              _workFunCardData[0].status = 0;
              Get.snackbar('提示', '运行成功', colorText: Colors.black);
              debugPrint('运行成功');
            } else {
              Get.snackbar('提示', '运行失败');
              debugPrint('运行失败');
            }
          } else {
            CronStop cronStop = CronStop();
            cronStop.setData('[${widget.workData.id}]');
            var value = await Http.getInstance().fire(cronStop);
            BaseModel baseModel = BaseModel.fromJson(value);
            if (baseModel.code == 200) {
              _workFunCardData[0].status = 1;
              Get.snackbar('提示', '停止成功', colorText: Colors.black);
              debugPrint('停止成功');
            } else {
              Get.snackbar('提示', '停止失败');
              debugPrint('停止失败');
            }
          }
          setState(() {});
        },
      ),
      WorkFunCardModel(
        item: [
          WorkFunCardItemModel(
            '日志',
            Icon(
              Icons.calendar_view_day,
              size: 36,
              color: Colors.green[400],
            ),
          ),
        ],
        action: () {
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            backgroundColor: Colors.white,
            builder: (context) {
              return WorkLog(commandIndex: widget.workData.id);
            },
          );
        },
      ),
      WorkFunCardModel(
        item: [
          WorkFunCardItemModel(
            '编辑',
            Icon(
              Icons.edit,
              size: 36,
              color: Colors.green[400],
            ),
          ),
        ],
        action: () {
          Get.toNamed('/edit_work', arguments: {
            'workData': widget.workData,
          });
        },
      ),
      WorkFunCardModel(
        item: [
          WorkFunCardItemModel(
            '删除',
            Icon(
              Icons.delete_forever,
              size: 36,
              color: Colors.red[400],
            ),
          ),
        ],
        action: () async {
          CronDel cronDel = CronDel();
          cronDel.setData('[${widget.workData.id}]');
          var value = await Http.getInstance().fire(cronDel);
          BaseModel res = BaseModel.fromJson(value);
          if (res.code == 200) {
            Get.snackbar('提示', '删除成功', colorText: Colors.black);
            debugPrint('删除成功');
          } else {
            Get.snackbar('提示', '删除失败');
            debugPrint('删除失败');
          }
        },
      ),
      WorkFunCardModel(
        item: [
          WorkFunCardItemModel(
            '禁用',
            Icon(
              Icons.stop,
              size: 36,
              color: Colors.green[400],
            ),
          ),
          WorkFunCardItemModel(
            '启用',
            Icon(
              Icons.not_started_outlined,
              size: 36,
              color: Colors.red[400],
            ),
          ),
        ],
        status: widget.workData.isDisabled,
        action: () async {
          if (_workFunCardData[4].status == 0) {
            CronDisable cronDisable = CronDisable();
            cronDisable.setData('[${widget.workData.id}]');
            var value = await Http.getInstance().fire(cronDisable);
            BaseModel baseModel = BaseModel.fromJson(value);
            if (baseModel.code == 200) {
              _workFunCardData[4].status = 1;
              Get.snackbar('提示', '禁用成功', colorText: Colors.black);
              debugPrint('禁用成功');
            } else {
              Get.snackbar('提示', '禁用失败');
              debugPrint('禁用失败');
            }
          } else {
            CronEnable cronEnable = CronEnable();
            cronEnable.setData('[${widget.workData.id}]');
            var value = await Http.getInstance().fire(cronEnable);
            BaseModel baseModel = BaseModel.fromJson(value);
            if (baseModel.code == 200) {
              _workFunCardData[4].status = 0;
              Get.snackbar('提示', '启用成功', colorText: Colors.black);
              debugPrint('启用成功');
            } else {
              Get.snackbar('提示', '启用失败');
              debugPrint('启用失败');
            }
          }
          setState(() {});
        },
      ),
      WorkFunCardModel(
          item: [
            WorkFunCardItemModel(
              '置顶',
              Icon(
                Icons.vertical_align_top_outlined,
                size: 36,
                color: Colors.green[400],
              ),
            ),
            WorkFunCardItemModel(
              '取消置顶',
              Icon(
                Icons.vertical_align_top_outlined,
                size: 36,
                color: Colors.red[400],
              ),
            ),
          ],
          status: widget.workData.isPinned,
          action: () async {
            if (_workFunCardData[5].status == 0) {
              CronPin cronPin = CronPin();
              cronPin.setData('[${widget.workData.id}]');
              var value = await Http.getInstance().fire(cronPin);
              BaseModel baseModel = BaseModel.fromJson(value);
              if (baseModel.code == 200) {
                _workFunCardData[5].status = 1;
                Get.snackbar('提示', '置顶成功', colorText: Colors.black);
                debugPrint('置顶成功');
              } else {
                Get.snackbar('提示', '置顶失败');
                debugPrint('置顶失败');
              }
            } else {
              CronUnpin cronUnpin = CronUnpin();
              cronUnpin.setData('[${widget.workData.id}]');
              var value = await Http.getInstance().fire(cronUnpin);
              BaseModel baseModel = BaseModel.fromJson(value);
              if (baseModel.code == 200) {
                _workFunCardData[5].status = 0;
                Get.snackbar('提示', '取消置顶成功', colorText: Colors.black);
                debugPrint('取消置顶成功');
              } else {
                Get.snackbar('提示', '取消置顶失败');
                debugPrint('取消置顶失败');
              }
            }
            setState(() {});
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(),
        const SizedBox(height: 8),
        const Center(
          child: SizedBox(
            width: 30,
            height: 25,
            child: Divider(
              thickness: 3,
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: _workFunCardData.map((e) => _buildFunCard(e)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFunCard(WorkFunCardModel workFunCardModel) {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: workFunCardModel.action,
            icon: workFunCardModel.item[workFunCardModel.status].funIcon,
          ),
          Text(
            workFunCardModel.item[workFunCardModel.status].funName,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      );
    });
  }
}

class WorkFunCardModel {
  int status;
  final List<WorkFunCardItemModel> item;
  void Function() action;

  WorkFunCardModel({this.status = 0, required this.item, required this.action});
}

class WorkFunCardItemModel {
  final String funName;
  final Widget funIcon;
  WorkFunCardItemModel(this.funName, this.funIcon);
}
