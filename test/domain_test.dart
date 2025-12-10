import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  group('Question Entity', () {
    test('should create a valid Question entity', () {
      final question = Question(
        id: '1',
        text: 'What is Clean Architecture?',
        type: QuestionType.multipleChoice,
        options: [
          QuestionOption(
            id: '1',
            text: 'A software design pattern',
            order: 1,
            isCorrect: true,
          ),
          QuestionOption(
            id: '2',
            text: 'A programming language',
            order: 2,
            isCorrect: false,
          ),
        ],
        correctAnswers: ['1'],
        difficulty: DifficultyLevel.medium,
        points: 10,
        tags: ['architecture', 'software'],
        isActive: true,
        createdAt: DateTime.now(),
      );

      expect(question.id, '1');
      expect(question.text, 'What is Clean Architecture?');
      expect(question.type, QuestionType.multipleChoice);
      expect(question.options.length, 2);
      expect(question.isValid(), isTrue);
    });

    test('should validate question with empty text as invalid', () {
      final question = Question(
        id: '1',
        text: '',
        type: QuestionType.multipleChoice,
        options: [
          QuestionOption(
            id: '1',
            text: 'Option 1',
            order: 1,
            isCorrect: true,
          ),
          QuestionOption(
            id: '2',
            text: 'Option 2',
            order: 2,
            isCorrect: false,
          ),
        ],
        correctAnswers: ['1'],
        difficulty: DifficultyLevel.easy,
        points: 5,
        tags: [],
        isActive: true,
        createdAt: DateTime.now(),
      );

      expect(question.isValid(), isFalse);
    });

    test('should validate multiple choice question needs at least 2 options', () {
      final question = Question(
        id: '1',
        text: 'Test question',
        type: QuestionType.multipleChoice,
        options: [
          QuestionOption(
            id: '1',
            text: 'Only option',
            order: 1,
            isCorrect: true,
          ),
        ],
        correctAnswers: ['1'],
        difficulty: DifficultyLevel.easy,
        points: 5,
        tags: [],
        isActive: true,
        createdAt: DateTime.now(),
      );

      expect(question.isValid(), isFalse);
    });

    test('should support copyWith for immutability', () {
      final original = Question(
        id: '1',
        text: 'Original question',
        type: QuestionType.multipleChoice,
        options: [],
        correctAnswers: ['1'],
        difficulty: DifficultyLevel.easy,
        points: 5,
        tags: [],
        isActive: true,
        createdAt: DateTime.now(),
      );

      final updated = original.copyWith(
        text: 'Updated question',
        points: 10,
      );

      expect(updated.text, 'Updated question');
      expect(updated.points, 10);
      expect(updated.id, original.id);
      expect(updated.difficulty, original.difficulty);
    });
  });

  group('QuestionOption Entity', () {
    test('should create a valid QuestionOption entity', () {
      final option = QuestionOption(
        id: '1',
        text: 'Test option',
        order: 1,
        isCorrect: true,
      );

      expect(option.id, '1');
      expect(option.text, 'Test option');
      expect(option.order, 1);
      expect(option.isCorrect, isTrue);
    });

    test('should support copyWith for immutability', () {
      final original = QuestionOption(
        id: '1',
        text: 'Original',
        order: 1,
        isCorrect: false,
      );

      final updated = original.copyWith(
        text: 'Updated',
        isCorrect: true,
      );

      expect(updated.text, 'Updated');
      expect(updated.isCorrect, isTrue);
      expect(updated.id, original.id);
      expect(updated.order, original.order);
    });

    test('should support equality comparison with Equatable', () {
      final option1 = QuestionOption(
        id: '1',
        text: 'Option',
        order: 1,
        isCorrect: true,
      );

      final option2 = QuestionOption(
        id: '1',
        text: 'Option',
        order: 1,
        isCorrect: true,
      );

      expect(option1, equals(option2));
    });
  });

  group('Domain Exceptions', () {
    test('should create QuestionNotFoundException', () {
      const exception = QuestionNotFoundException('Question not found');
      expect(exception.message, 'Question not found');
      expect(exception.toString(), contains('QuestionNotFoundException'));
    });

    test('should create InvalidQuestionException', () {
      const exception = InvalidQuestionException('Invalid data');
      expect(exception.message, 'Invalid data');
      expect(exception.toString(), contains('InvalidQuestionException'));
    });

    test('should include error code in exception', () {
      const exception = QuestionNotFoundException('Not found', 'ERR_404');
      expect(exception.code, 'ERR_404');
      expect(exception.toString(), contains('ERR_404'));
    });
  });
}
