class DataState<T> {
  Status status;
  T? data;
  String? messages;


  DataState.initial(this.messages) : status = Status.INITIAL;

  DataState.loading(this.messages) : status = Status.LOADING;

  DataState.completed(this.data) : status = Status.COMPLETED;

  DataState.error(this.messages) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \nMessage : $messages \nData : $data";
  }

}

// Enum for different API states
enum Status { INITIAL, LOADING, COMPLETED, ERROR }




