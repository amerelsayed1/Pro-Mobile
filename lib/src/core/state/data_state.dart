class DataState<T> {
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
    return "Status : $status \nMessage : $message \nData : $data";
  }

}

// Enum for different API states
enum Status { INITIAL, LOADING, COMPLETED, ERROR }




