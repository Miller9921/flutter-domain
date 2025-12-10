import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for updating an existing question
class UpdateQuestionUseCase {
  final QuestionRepository repository;

  const UpdateQuestionUseCase(this.repository);

  /// Executes the use case to update a question
  /// Validates the question before updating
  Future<Either<DomainException, Question>> call(Question question) async {
    // Validate question ID
    if (question.id.trim().isEmpty) {
      return Left(
        InvalidQuestionException('Question ID cannot be empty'),
      );
    }

    // Validate question data
    if (!question.isValid()) {
      return Left(
        InvalidQuestionException('Question data is invalid'),
      );
    }

    return await repository.updateQuestion(question);
  }
}
