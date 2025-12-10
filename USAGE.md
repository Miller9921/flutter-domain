# Domain Layer Example Usage

## Basic Usage

```dart
import 'package:domain/domain.dart';

// 1. Create a Question entity
final question = Question(
  id: 'q1',
  text: 'What is Clean Architecture?',
  type: QuestionType.multipleChoice,
  options: [
    QuestionOption(
      id: 'opt1',
      text: 'A software design pattern',
      order: 1,
      isCorrect: true,
    ),
    QuestionOption(
      id: 'opt2',
      text: 'A programming language',
      order: 2,
      isCorrect: false,
    ),
  ],
  correctAnswers: ['opt1'],
  difficulty: DifficultyLevel.medium,
  points: 10,
  tags: ['architecture', 'software'],
  isActive: true,
  createdAt: DateTime.now(),
);

// 2. Use cases (requires repository implementation from infrastructure layer)
final repository = QuestionRepositoryImpl(); // From infrastructure layer
final getAllQuestionsUseCase = GetAllQuestionsUseCase(repository);

// Get all active questions
final result = await getAllQuestionsUseCase();
result.fold(
  (error) => print('Error: ${error.message}'),
  (questions) => print('Found ${questions.length} questions'),
);

// 3. Create a new question
final createUseCase = CreateQuestionUseCase(repository);
final createResult = await createUseCase(question);
createResult.fold(
  (error) => print('Failed to create: ${error.message}'),
  (createdQuestion) => print('Created question with ID: ${createdQuestion.id}'),
);

// 4. Search questions
final searchUseCase = SearchQuestionsUseCase(repository);
final searchResult = await searchUseCase(
  searchText: 'architecture',
  difficulty: DifficultyLevel.medium,
  tags: ['software'],
);

// 5. Handle different exception types
searchResult.fold(
  (error) {
    if (error is QuestionNotFoundException) {
      print('Question not found');
    } else if (error is InvalidQuestionException) {
      print('Invalid question data');
    } else {
      print('Unknown error: ${error.message}');
    }
  },
  (questions) => print('Found ${questions.length} questions'),
);
```

## Repository Implementation (Infrastructure Layer)

The repository interface is defined in the domain layer, but the implementation belongs in the infrastructure layer:

```dart
// In infrastructure layer
class QuestionRepositoryImpl implements QuestionRepository {
  final ApiClient apiClient;
  
  QuestionRepositoryImpl(this.apiClient);
  
  @override
  Future<Either<DomainException, List<Question>>> getAllQuestions() async {
    try {
      final response = await apiClient.get('/questions');
      final questions = response.data.map((json) => Question.fromJson(json)).toList();
      return Right(questions);
    } catch (e) {
      return Left(QuestionOperationException('Failed to fetch questions'));
    }
  }
  
  // Implement other methods...
}
```

## Key Principles

1. **Pure Dart**: No Flutter imports allowed in domain layer
2. **Equatable**: All entities use Equatable for value comparison
3. **Either**: All use cases return `Either<DomainException, T>` for error handling
4. **Abstract Repositories**: Repository interfaces in domain, implementations in infrastructure
5. **Single Responsibility**: Each use case has one clear responsibility
6. **Business Logic**: Entities contain validation and business rules
