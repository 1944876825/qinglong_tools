import 'package:qinglong_tools/http/request/base_request.dart';

// 运行
class CronRun extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/run';
  }
}

// 搜索
class CronSearch extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.get;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons';
  }
}

// 日志
class CronLog extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.get;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/';
  }
}

// 启用
class CronEnable extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/enable';
  }
}

// 禁用
class CronDisable extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/disable';
  }
}

// 置顶
class CronPin extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/pin';
  }
}

// 取消置顶
class CronUnpin extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons/unpin';
  }
}

// 创建任务
class CronAdd extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.post;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons';
  }
}

// 编辑任务
class CronEdit extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.put;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons';
  }
}

// 删除任务
class CronDel extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.delete;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/api/crons';
  }
}
