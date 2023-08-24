/*abstract*/ class DataState<T> {
  //final T? data;
  //final String? error;
  Status status;
  T? data;
  String? message;



  //DataState({this.data, this.error});

  DataState.initial(this.message) : status = Status.INITIAL;

  DataState.loading(this.message) : status = Status.LOADING;

  DataState.completed(this.data) : status = Status.COMPLETED;

  DataState.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }



/*
class InitialState<T> extends DataState {}

class LoadingState<T> extends DataState {}

class DataSuccess<R> extends DataState<R> {
  DataSuccess({R? data}) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  DataFailure({String? error}) : super(error: error);
}
*/
