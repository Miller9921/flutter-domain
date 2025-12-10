import 'package:dartz/dartz.dart';

import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for deleting a question
class DeleteQuestionUseCase {
  final QuestionRepository repository;

  const DeleteQuestionUseCase(this.repository);

  /// Executes the use case to delete a question by ID
  Future<Either<DomainException, void>> call(String id) async {
    if (id.trim().isEmpty) {
      return Left(
        InvalidQuestionException('Question ID cannot be empty'),
      );
    }

    return await repository.deleteQuestion(id);
  }
}
