class BaseModel<T> {
  final int code;
  final String? message;
  final T data;
  BaseModel({required this.code, required this.data, this.message});

  factory BaseModel.fromJson(Map item) {
    // 调用自身构造方法传值并返回
    return BaseModel(
      code: item['code'],
      data: item['data'],
      message: item['message'],
    );
  }
}
