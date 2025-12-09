import '../entities/product.dart';

/// Repository interface for Product operations.
/// This is an abstract class that defines the contract for product data access.
/// Implementations will be provided in the infrastructure layer.
abstract class ProductRepository {
  /// Get all products from the repository
  Future<List<Product>> getAllProducts();

  /// Get a specific product by its ID
  /// Returns null if the product is not found
  Future<Product?> getProductById(String id);

  /// Search products by query string
  /// The query can match against product name or description
  Future<List<Product>> searchProducts(String query);
}
