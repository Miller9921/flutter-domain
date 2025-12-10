import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for retrieving a question by its ID
class GetQuestionByIdUseCase {
  final QuestionRepository repository;

  const GetQuestionByIdUseCase(this.repository);

  /// Executes the use case to get a question by ID
  Future<Either<DomainException, Question>> call(String id) async {
    if (id.trim().isEmpty) {
      return Left(
        InvalidQuestionException('Question ID cannot be empty'),
      );
    }

    return await repository.getQuestionById(id);
  }
}
