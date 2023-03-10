class ServerException implements Exception {
  final dynamic message;

  ServerException([this.message]);

  @override
  String toString() {
    final Object? message = this.message;

    if (message == null) return 'ServerException';

    return 'ServerException: $message';
  }
}

class DomainException implements Exception {
  final dynamic message;

  DomainException([this.message]);

  @override
  String toString() {
    final Object? message = this.message;

    if (message == null) return 'DomainException';

    return 'DomainException: $message';
  }
}