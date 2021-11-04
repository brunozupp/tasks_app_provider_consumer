class ResponseRepositoryModel<T> {

  final bool _success;
  bool get isSuccess => _success;

  final bool _error;
  bool get isError => _error;

  final bool _notFound;
  bool get isNotFound => _notFound;

  T? data;
  String? message;

  ResponseRepositoryModel.success({
    this.data, this.message
  }) :
    _success = true,
    _error = false,
    _notFound = false;

  ResponseRepositoryModel.error({
    this.message
  }) :
    _success = false,
    _error = true,
    _notFound = false;

  ResponseRepositoryModel.notFound({
    this.message
  }) :
    _success = false,
    _error = false,
    _notFound = true;
}