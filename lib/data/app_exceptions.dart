

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

//404
class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

//400
class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Bad Request');
}

//401
class UnauthorizedAccessException extends AppExceptions {
  UnauthorizedAccessException([String? message])
      : super(message, 'Unauthorized Access');
}

//500
class InternalServerErrorException extends AppExceptions {
  InternalServerErrorException([String? message])
      : super(message, 'Internal Server Error');
}
