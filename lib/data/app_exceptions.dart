class AppExceptions implements Exception {
  String message = 'unknown';
  String prefix = 'unknown';
  AppExceptions(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class CustomException extends AppExceptions {
  CustomException([String? message, String? prefix]) : super(message!, prefix!);
}

//404
class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message!, 'Error During Communication');
}

//400
class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message!, 'Bad Request');
}

//401
class UnauthorizedAccessException extends AppExceptions {
  UnauthorizedAccessException([String? message])
      : super(message!, 'Unauthorized Access');
}

//500
class InternalServerErrorException extends AppExceptions {
  InternalServerErrorException([String? message])
      : super(message!, 'Internal Server Error');
}
