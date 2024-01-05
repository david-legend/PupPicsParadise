import 'package:dio/dio.dart';
import 'package:dog_images/features/common/domain/failures/failure.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:dog_images/main.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          code: error.response?.statusCode ?? 0,
          message: error.response?.data["message"] ?? "",
        );
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  empty,
  defaultError
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    var mContext = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: mContext.loc.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: mContext.loc.noContent,
        );
      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: mContext.loc.badRequestError,
        );
      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: mContext.loc.forbiddenError,
        );
      case DataSource.unAuthorized:
        return Failure(
          code: ResponseCode.unAuthorized,
          message: mContext.loc.unauthorizedError,
        );
      case DataSource.notFound:
        return Failure(
          code: ResponseCode.notFound,
          message: mContext.loc.notFoundError,
        );
      case DataSource.internalServerError:
        return Failure(
          code: ResponseCode.internalServerError,
          message: mContext.loc.internalServerError,
        );
      case DataSource.connectionTimeout:
        return Failure(
          code: ResponseCode.connectionTimeout,
          message: mContext.loc.timeoutError,
        );
      case DataSource.cancel:
        return Failure(
          code: ResponseCode.cancel,
          message: mContext.loc.defaultError,
        );
      case DataSource.receiveTimeout:
        return Failure(
          code: ResponseCode.receiveTimeout,
          message: mContext.loc.timeoutError,
        );
      case DataSource.sendTimeout:
        return Failure(
          code: ResponseCode.sendTimeout,
          message: mContext.loc.timeoutError,
        );
      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: mContext.loc.cacheError,
        );
      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternConnection,
          message: mContext.loc.noInternetError,
        );
      case DataSource.empty:
        return Failure(
          code: ResponseCode.empty,
          message: mContext.loc.emptyError,
        );
      case DataSource.defaultError:
        return Failure(
          code: ResponseCode.defaultError,
          message: mContext.loc.defaultError,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternConnection = -6;
  static const int empty = -7;
  static const int defaultError = -8;
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 400;
}
