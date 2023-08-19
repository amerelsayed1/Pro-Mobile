abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({this.data, this.error});
}

class InitialState<T> extends DataState {}

class LoadingState<T> extends DataState {}

class DataSuccess<R> extends DataState<R> {
  DataSuccess({R? data}) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  DataFailure({String? error}) : super(error: error);
}
