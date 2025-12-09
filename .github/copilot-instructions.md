# Domain Layer - GitHub Copilot Instructions

## Architecture Rules

This is the **Domain Layer** of a Clean Architecture implementation. Follow these strict rules:

### ❌ NEVER Import

- **Flutter packages**: `dart:ui`, `package:flutter/material.dart`, `package:flutter/widgets.dart`, etc.
- **Infrastructure packages**: Database implementations, HTTP clients, external APIs
- **Implementation packages**: Concrete repository implementations, data sources
- **Platform-specific code**: `dart:io`, `dart:html`, etc. (unless absolutely necessary for pure business logic)

### ✅ ALWAYS Use

- **Pure Dart**: Only `dart:core`, `dart:async`, `dart:collection`, `dart:math`, etc.
- **Abstract classes**: Define repository interfaces as abstract classes
- **Value objects**: Immutable entities with business logic
- **Functional programming**: Use packages like `dartz` for functional error handling

## Structure

```
lib/
├── src/
│   ├── entities/          # Business entities with domain logic
│   ├── use_cases/         # Application business rules (one per use case)
│   ├── repositories/      # Repository interfaces (abstract classes)
│   └── exceptions/        # Domain-specific exceptions
└── domain.dart            # Main barrel export
```

## Examples

### Entity Example

```dart
class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });
  
  // Business logic getter
  bool get isAvailable => stock > 0;
  
  // Business logic method
  Product copyWith({String? name, double? price, int? stock}) {
    return Product(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }
}
```

### Repository Interface Example

```dart
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String id);
}
```

### Use Case Example

```dart
class GetAllProductsUseCase {
  final ProductRepository _repository;
  
  const GetAllProductsUseCase(this._repository);
  
  Future<List<Product>> call() async {
    final products = await _repository.getAllProducts();
    // Apply business rules
    return products.where((p) => p.isAvailable).toList();
  }
}
```

### Exception Example

```dart
abstract class DomainException implements Exception {
  final String message;
  const DomainException(this.message);
}

class ProductNotFoundException extends DomainException {
  const ProductNotFoundException(String id) 
    : super('Product with id $id not found');
}
```

## Principles

1. **Single Responsibility**: Each use case does one thing
2. **Dependency Inversion**: Depend on abstractions (repository interfaces)
3. **Pure Business Logic**: No framework dependencies
4. **Immutability**: Entities should be immutable when possible
5. **Explicit Error Handling**: Use exceptions or Either types for errors

## Testing

- Unit tests should not require mocking Flutter
- Test business logic in isolation
- Use mock repository implementations for use case tests
