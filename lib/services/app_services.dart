class AppException implements Exception{
  final String message;
  final String prefix;
  final String url;

  AppException(this.message, this.prefix, this.url);
}

class BadRequestException extends AppException{
BadRequestException(String message, String url) : super(message, 'Bad Request Exception', url);
}

class FetchDataException extends AppException{
FetchDataException(String message, String url) : super(message, 'Fetch Data Exception', url);
}
class ApiNotResponding extends AppException{
ApiNotResponding(String message, String url) : super(message, 'Api Not Responding Exception', url);
}

class UnAuthorizedException extends AppException{
UnAuthorizedException(String message, String url) : super(message, 'UnAuthorized Exception', url);
}

