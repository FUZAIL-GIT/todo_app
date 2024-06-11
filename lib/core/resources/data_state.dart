abstract class DataState<T> {
  const DataState({this.data, this.error});
  final T? data;
  final AppException? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(AppException error) : super(error: error);
}

class AppException {
  final String errorMessage;
  final String code;

  AppException(this.errorMessage, this.code);
}
