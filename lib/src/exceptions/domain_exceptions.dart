/// Base class for all domain exceptions
abstract class DomainException implements Exception {
  final String message;

  const DomainException(this.message);

  @override
  String toString() => message;
}

/// Exception thrown when a product is not found
class ProductNotFoundException extends DomainException {
  const ProductNotFoundException(String id)
      : super('Product with id "$id" not found');
}

/// Exception thrown when a product has invalid data
class InvalidProductException extends DomainException {
  const InvalidProductException(String reason)
      : super('Invalid product: $reason');
}
