import 'package:dartz/dartz.dart';

import '../../entities/question.dart';
import '../../exceptions/question_exceptions.dart';
import '../../repositories/question_repository.dart';

/// Use case for searching questions
class SearchQuestionsUseCase {
  final QuestionRepository repository;

  const SearchQuestionsUseCase(this.repository);

  /// Executes the use case to search questions
  /// Returns only active questions by default
  Future<Either<DomainException, List<Question>>> call({
    String? searchText,
    List<String>? tags,
    QuestionType? type,
    DifficultyLevel? difficulty,
    bool includeInactive = false,
  }) async {
    final result = await repository.searchQuestions(
      searchText: searchText,
      tags: tags,
      type: type,
      difficulty: difficulty,
      isActive: includeInactive ? null : true,
    );

    return result.map((questions) {
      // Additional filtering if needed
      if (!includeInactive) {
        return questions.where((question) => question.isActive).toList();
      }
      return questions;
    });
  }
}
