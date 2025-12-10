/// Domain layer - Pure business logic following Clean Architecture
/// 
/// This library exports all domain entities, use cases, repositories,
/// and exceptions for the LMS Question Management module.
/// 
/// This is pure Dart code with no Flutter dependencies.
library domain;

// Entities
export 'src/entities/question.dart';
export 'src/entities/question_option.dart';

// Repositories
export 'src/repositories/question_repository.dart';

// Use Cases
export 'src/use_cases/question/get_all_questions_use_case.dart';
export 'src/use_cases/question/get_question_by_id_use_case.dart';
export 'src/use_cases/question/create_question_use_case.dart';
export 'src/use_cases/question/update_question_use_case.dart';
export 'src/use_cases/question/delete_question_use_case.dart';
export 'src/use_cases/question/search_questions_use_case.dart';
export 'src/use_cases/question/get_questions_by_difficulty_use_case.dart';
export 'src/use_cases/question/get_questions_by_type_use_case.dart';

// Exceptions
export 'src/exceptions/question_exceptions.dart';
