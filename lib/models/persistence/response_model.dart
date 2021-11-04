import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';

class ResponseModel {
  
  final bool _success;
  bool get isSuccess => _success;

  final bool _error;
  bool get isError => _error;

  final bool _notFound;
  bool get isNotFound => _notFound;

  String? message;

  ResponseModel.fromResponseRepositoryModel(ResponseRepositoryModel responseRepositoryModel) :
    _success = responseRepositoryModel.isSuccess,
    _notFound = responseRepositoryModel.isNotFound,
    _error = responseRepositoryModel.isError,
    message = responseRepositoryModel.message;
}