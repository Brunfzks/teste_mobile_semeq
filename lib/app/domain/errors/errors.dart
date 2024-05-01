class UserException implements Exception {
  final String message;
  UserException({
    required this.message,
  });

  @override
  String toString() => 'UserException(message: $message)';
}
