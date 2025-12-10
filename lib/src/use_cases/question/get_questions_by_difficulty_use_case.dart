import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for retrieving questions by difficulty level
class GetQuestionsByDifficultyUseCase {
  final QuestionRepository repository;

  const GetQuestionsByDifficultyUseCase(this.repository);

  /// Executes the use case to get questions by difficulty
  /// Returns only active questions by default
  Future<Either<DomainException, List<Question>>> call(
    DifficultyLevel difficulty, {
    bool includeInactive = false,
  }) async {
    final result = await repository.getQuestionsByDifficulty(difficulty);

    return result.map((questions) {
      if (includeInactive) {
        return questions;
      }
      // Filter to only return active questions
      return questions.where((question) => question.isActive).toList();
    });
  }
}
