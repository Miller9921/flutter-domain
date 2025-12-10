import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for creating a new question
class CreateQuestionUseCase {
  final QuestionRepository repository;

  const CreateQuestionUseCase(this.repository);

  /// Executes the use case to create a new question
  /// Validates the question before creating
  Future<Either<DomainException, Question>> call(Question question) async {
    // Validate question data
    if (!question.isValid()) {
      return Left(
        InvalidQuestionException('Question data is invalid'),
      );
    }

    return await repository.createQuestion(question);
  }
}
