/// Domain Layer - Pure Dart Business Logic
///
/// This library contains the core business logic of the application:
/// - Entities: Business objects with domain logic
/// - Use Cases: Application-specific business rules
/// - Repositories: Interfaces for data access (implementations in infrastructure layer)
/// - Exceptions: Domain-specific error types
///
/// This layer has NO dependencies on Flutter or any infrastructure code.
library domain;

export 'src/entities/entities.dart';
export 'src/exceptions/exceptions.dart';
export 'src/repositories/repositories.dart';
export 'src/use_cases/use_cases.dart';
