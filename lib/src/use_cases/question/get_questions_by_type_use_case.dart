import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for retrieving questions by type
class GetQuestionsByTypeUseCase {
  final QuestionRepository repository;

  const GetQuestionsByTypeUseCase(this.repository);

  /// Executes the use case to get questions by type
  /// Returns only active questions by default
  Future<Either<DomainException, List<Question>>> call(
    QuestionType type, {
    bool includeInactive = false,
  }) async {
    final result = await repository.getQuestionsByType(type);

    return result.map((questions) {
      if (includeInactive) {
        return questions;
      }
      // Filter to only return active questions
      return questions.where((question) => question.isActive).toList();
    });
  }
}
