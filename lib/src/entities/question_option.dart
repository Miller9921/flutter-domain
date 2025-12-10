import 'package:equatable/equatable.dart';

/// Represents an option/choice for a question
class QuestionOption extends Equatable {
  /// Unique identifier for the option
  final String id;

  /// The text content of the option
  final String text;

  /// Order/position of this option in the list
  final int order;

  /// Whether this option is correct (for internal validation)
  final bool isCorrect;

  const QuestionOption({
    required this.id,
    required this.text,
    required this.order,
    required this.isCorrect,
  });

  /// Creates a copy of this QuestionOption with the given fields replaced
  QuestionOption copyWith({
    String? id,
    String? text,
    int? order,
    bool? isCorrect,
  }) {
    return QuestionOption(
      id: id ?? this.id,
      text: text ?? this.text,
      order: order ?? this.order,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  @override
  List<Object?> get props => [id, text, order, isCorrect];
}
