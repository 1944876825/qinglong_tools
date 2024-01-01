class WorkModel {
  final int id;
  final String name;
  final String command;
  final String schedule;
  final String timestamp;
  final bool saved;
  final int status;
  final int isSystem;
  final int? pid;
  final int isDisabled;
  final int isPinned;
  final String log_path;
  final List labels;
  final Object last_running_time;
  final int last_execution_time;
  final int? sub_id;
  final Object? extra_schedules;
  final String? task_before;
  final String? task_after;
  final String createdAt;
  final String updatedAt;

  WorkModel({
    required this.id,
    required this.name,
    required this.command,
    required this.schedule,
    required this.timestamp,
    required this.saved,
    required this.status,
    required this.isSystem,
    required this.pid,
    required this.isDisabled,
    required this.isPinned,
    required this.log_path,
    required this.labels,
    required this.last_running_time,
    required this.last_execution_time,
    required this.sub_id,
    required this.extra_schedules,
    required this.task_before,
    required this.task_after,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      id: json['id'],
      name: json['name'],
      command: json['command'],
      schedule: json['schedule'],
      timestamp: json['timestamp'],
      saved: json['saved'],
      status: json['status'],
      isSystem: json['isSystem'],
      pid: json['pid'],
      isDisabled: json['isDisabled'],
      isPinned: json['isPinned'],
      log_path: json['log_path'],
      labels: json['labels'],
      last_running_time: json['last_running_time'],
      last_execution_time: json['last_execution_time'],
      sub_id: json['sub_id'],
      extra_schedules: json['extra_schedules'],
      task_before: json['task_before'],
      task_after: json['task_after'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

// {
//   "id": 2,
//   "name": "滴滴",
//   "command": "didi.js",
//   "schedule": "0 0 10 * * *",
//   "timestamp": "Thu Dec 28 2023 22:26:05 GMT+0800 (China Standard Time)",
//   "saved": true,
//   "status": 1,
//   "isSystem": 0,
//   "pid": 23124,
//   "isDisabled": 1,
//   "isPinned": 0,
//   "log_path": "didi_2/2023-12-28-22-33-48-301.log",
//   "labels": [],
//   "last_running_time": 1,
//   "last_execution_time": 1703774028,
//   "sub_id": null,
//   "extra_schedules": null,
//   "task_before": null,
//   "task_after": null,
//   "createdAt": "2023-12-28T14:26:05.486Z",
//   "updatedAt": "2023-12-28T15:02:23.067Z"
// }
