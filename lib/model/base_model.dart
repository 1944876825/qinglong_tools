class BaseModel<T> {
  final int code;
  final T data;
  BaseModel({required this.code, required this.data});

  factory BaseModel.fromJson(Map item) {
    // 调用自身构造方法传值并返回
    return BaseModel(
      code: item['code'],
      data: item['data'],
    );
  }
}
