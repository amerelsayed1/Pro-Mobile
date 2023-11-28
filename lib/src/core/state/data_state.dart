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




