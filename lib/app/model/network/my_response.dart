// class MyResponse<T, V> {
//   MyResponse.error(V error)
//       : _status = ResponseStatus.ERROR,
//         _error = error;
//   MyResponse.complete(T data)
//       : _status = ResponseStatus.COMPLETE,
//         _data = data;
//   MyResponse.loading() : _status = ResponseStatus.LOADING;

//   MyResponse.initial() : _status = ResponseStatus.INITIAL;
//   final ResponseStatus _status;
//   T? _data;
//   V? _error;

//   V? get error => _error;
//   T? get data => _data;
//   ResponseStatus get status => _status;
// }

// // ignore: constant_identifier_names
// enum ResponseStatus { INITIAL, COMPLETE, ERROR, LOADING, CONSUMED }

import 'package:dio/src/dio_exception.dart';

class MyResponse<T, E> {
  final T? data;
  final E? error;
  final bool isSuccess;

  MyResponse.success({this.data})
      : isSuccess = true,
        error = null;
  MyResponse.error(DioException dioError, {this.error})
      : isSuccess = false,
        data = null;
}
