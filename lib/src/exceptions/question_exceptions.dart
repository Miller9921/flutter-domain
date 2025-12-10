/// Base exception class for domain layer
abstract class DomainException implements Exception {
  final String message;
  final String? code;

  const DomainException(this.message, [this.code]);

  @override
  String toString() => 'DomainException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Exception thrown when a question is not found
class QuestionNotFoundException extends DomainException {
  const QuestionNotFoundException([String message = 'Question not found', String? code])
      : super(message, code);

  @override
  String toString() => 'QuestionNotFoundException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Exception thrown when question data is invalid
class InvalidQuestionException extends DomainException {
  const InvalidQuestionException([String message = 'Invalid question data', String? code])
      : super(message, code);

  @override
  String toString() => 'InvalidQuestionException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Exception thrown when a question operation fails
class QuestionOperationException extends DomainException {
  const QuestionOperationException([String message = 'Question operation failed', String? code])
      : super(message, code);

  @override
  String toString() => 'QuestionOperationException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Exception thrown when unauthorized access to questions
class UnauthorizedQuestionAccessException extends DomainException {
  const UnauthorizedQuestionAccessException([String message = 'Unauthorized question access', String? code])
      : super(message, code);

  @override
  String toString() => 'UnauthorizedQuestionAccessException: $message${code != null ? ' (code: $code)' : ''}';
}
