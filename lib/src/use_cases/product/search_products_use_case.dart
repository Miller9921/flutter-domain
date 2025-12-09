import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

/// Use case for searching products by query string.
/// Only returns products that are available (in stock).
class SearchProductsUseCase {
  final ProductRepository _repository;

  const SearchProductsUseCase(this._repository);

  /// Execute the use case
  /// Returns products matching the query and that are available
  Future<List<Product>> call(String query) async {
    final products = await _repository.searchProducts(query);
    // Apply business rule: only return available products
    return products.where((product) => product.isInStock).toList();
  }
}
