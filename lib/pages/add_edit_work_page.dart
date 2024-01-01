import 'package:flutter/material.dart';
import 'package:qinglong_tools/model/base_model.dart';

import '../http/core/http.dart';
import '../http/request/work_request.dart';

enum AddOrWorkType {
  add,
  edit,
}

class AddOrWorkPage extends StatefulWidget {
  final AddOrWorkType type;
  const AddOrWorkPage({super.key, this.type = AddOrWorkType.add});

  @override
  State<AddOrWorkPage> createState() => _AddOrWorkPageState();
}

class _AddOrWorkPageState extends State<AddOrWorkPage> {
  late TextEditingController name;
  late TextEditingController command;
  late TextEditingController schedule;
  @override
  void initState() {
    // 添加
    if (widget.type == AddOrWorkType.add) {
      name = TextEditingController();
      command = TextEditingController();
      schedule = TextEditingController();
    }
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
          widget.type == AddOrWorkType.add ? '创建任务' : '编辑任务',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (widget.type == AddOrWorkType.add) {
                CronAdd cronAdd = CronAdd();
                cronAdd
                    .addData('command', command.text)
                    .addData('name', name.text)
                    .addData('schedule', schedule.text);
                var value = await Http.getInstance().fire(cronAdd);
                BaseModel res = BaseModel.fromJson(value);
                if (res.code == 200) {
                  debugPrint('添加成功');
                } else {
                  debugPrint('添加失败');
                }
                // .addData('task_before', '')
                // .addData('task_after', '')
                // extra_schedules: [{schedule": "0 0 10 * * *"}]
                // labels: ['123']
              } else {
                CronEdit cronEdit = CronEdit();
                cronEdit
                    .addData('command', '')
                    .addData('name', '')
                    .addData('schedule', '');
                var value = await Http.getInstance().fire(cronEdit);
                BaseModel res = BaseModel.fromJson(value);
                if (res.code == 200) {
                  debugPrint('修改成功');
                } else {
                  debugPrint('修改失败');
                }
              }
            },
            child: Text(
              widget.type == AddOrWorkType.add ? '创建' : '修改',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInput('名称', name),
            _buildInput('命令/脚本', command),
            _buildInput('定时规则', schedule),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String title, TextEditingController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
