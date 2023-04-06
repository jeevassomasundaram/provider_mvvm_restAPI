import 'package:provider_with_mvvm/src/Data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({this.data, this.status, this.message});
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;
  @override
  String toString() {
    return "status : $status \n Message : $message \n Data : $data";
  }
}
