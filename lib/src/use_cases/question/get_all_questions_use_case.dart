import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for retrieving all questions
class GetAllQuestionsUseCase {
  final QuestionRepository repository;

  const GetAllQuestionsUseCase(this.repository);

  /// Executes the use case to get all questions
  /// Returns only active questions by default
  Future<Either<DomainException, List<Question>>> call({
    bool includeInactive = false,
  }) async {
    final result = await repository.getAllQuestions();
    
    return result.map((questions) {
      if (includeInactive) {
        return questions;
      }
      // Filter to only return active questions
      return questions.where((question) => question.isActive).toList();
    });
  }
}
