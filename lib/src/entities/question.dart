import 'package:equatable/equatable.dart';

import 'question_option.dart';

/// Represents a question in the LMS system
class Question extends Equatable {
  /// Unique identifier for the question
  final String id;

  /// The question text/content
  final String text;

  /// Type of question (multiple_choice, true_false, open_ended, etc.)
  final QuestionType type;

  /// List of available options for the question
  final List<QuestionOption> options;

  /// The correct answer(s) - can be option IDs or text depending on type
  final List<String> correctAnswers;

  /// Difficulty level of the question
  final DifficultyLevel difficulty;

  /// Points awarded for correct answer
  final int points;

  /// Optional explanation for the answer
  final String? explanation;

  /// Tags/categories for the question
  final List<String> tags;

  /// Whether the question is active/published
  final bool isActive;

  /// Date when the question was created
  final DateTime createdAt;

  /// Date when the question was last updated
  final DateTime? updatedAt;

  const Question({
    required this.id,
    required this.text,
    required this.type,
    required this.options,
    required this.correctAnswers,
    required this.difficulty,
    required this.points,
    this.explanation,
    required this.tags,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a copy of this Question with the given fields replaced
  Question copyWith({
    String? id,
    String? text,
    QuestionType? type,
    List<QuestionOption>? options,
    List<String>? correctAnswers,
    DifficultyLevel? difficulty,
    int? points,
    String? explanation,
    List<String>? tags,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      type: type ?? this.type,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      difficulty: difficulty ?? this.difficulty,
      points: points ?? this.points,
      explanation: explanation ?? this.explanation,
      tags: tags ?? this.tags,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Validates if the question has all required fields properly set
  bool isValid() {
    if (text.trim().isEmpty) return false;
    if (points <= 0) return false;
    if (correctAnswers.isEmpty) return false;
    
    // For multiple choice questions, must have at least 2 options
    if (type == QuestionType.multipleChoice && options.length < 2) {
      return false;
    }
    
    // For true/false questions, must have exactly 2 options
    if (type == QuestionType.trueFalse && options.length != 2) {
      return false;
    }
    
    return true;
  }

  @override
  List<Object?> get props => [
        id,
        text,
        type,
        options,
        correctAnswers,
        difficulty,
        points,
        explanation,
        tags,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Enum representing different types of questions
enum QuestionType {
  multipleChoice,
  trueFalse,
  openEnded,
  multipleAnswer,
  fillInTheBlank,
}

/// Enum representing difficulty levels
enum DifficultyLevel {
  easy,
  medium,
  hard,
  expert,
}
