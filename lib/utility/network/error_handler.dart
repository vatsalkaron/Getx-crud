class ErrorHandler {
  late final int? code;
  late final String? message;

  ErrorHandler({this.message, this.code});

  String getMessage() {
    switch (code) {
      case 400:
        return message ?? "Bad Response Format";
      case 401:
        return message ?? "Unautherized User";
      case 500:
        return message ?? "Internal Server Error";
      default:
        return message ?? "Unknown Error";
    }
  }
}
