class ApiResult<T> {
  String? message;
  T? data;
  int? status;

  ApiResult({required this.status, required this.data, required this.message});

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
      status: json["message"], data: json["data"], message: json["message"]);
}
