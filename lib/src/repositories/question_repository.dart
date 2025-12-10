import 'package:dartz/dartz.dart';

import '../entities/question.dart';
import '../exceptions/question_exceptions.dart';

/// Repository interface for Question operations
/// Implementation will be in the infrastructure layer
abstract class QuestionRepository {
  /// Gets all questions
  /// Returns Either<DomainException, List<Question>>
  Future<Either<DomainException, List<Question>>> getAllQuestions();

  /// Gets a question by its ID
  /// Returns Either<DomainException, Question>
  Future<Either<DomainException, Question>> getQuestionById(String id);

  /// Creates a new question
  /// Returns Either<DomainException, Question>
  Future<Either<DomainException, Question>> createQuestion(Question question);

  /// Updates an existing question
  /// Returns Either<DomainException, Question>
  Future<Either<DomainException, Question>> updateQuestion(Question question);

  /// Deletes a question by its ID
  /// Returns Either<DomainException, void>
  Future<Either<DomainException, void>> deleteQuestion(String id);

  /// Searches questions by text or tags
  /// Returns Either<DomainException, List<Question>>
  Future<Either<DomainException, List<Question>>> searchQuestions({
    String? searchText,
    List<String>? tags,
    QuestionType? type,
    DifficultyLevel? difficulty,
    bool? isActive,
  });

  /// Gets questions by difficulty level
  /// Returns Either<DomainException, List<Question>>
  Future<Either<DomainException, List<Question>>> getQuestionsByDifficulty(
    DifficultyLevel difficulty,
  );

  /// Gets questions by type
  /// Returns Either<DomainException, List<Question>>
  Future<Either<DomainException, List<Question>>> getQuestionsByType(
    QuestionType type,
  );
}
