import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

/// Use case for retrieving all available products.
/// Applies business rule: only return products that are in stock and available.
class GetAllProductsUseCase {
  final ProductRepository _repository;

  const GetAllProductsUseCase(this._repository);

  /// Execute the use case
  /// Returns only products that are available (in stock and marked as available)
  Future<List<Product>> call() async {
    final products = await _repository.getAllProducts();
    // Apply business rule: filter only available products
    return products.where((product) => product.isInStock).toList();
  }
}
