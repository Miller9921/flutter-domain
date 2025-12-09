import '../../entities/product.dart';
import '../../exceptions/domain_exceptions.dart';
import '../../repositories/product_repository.dart';

/// Use case for retrieving a product by its ID.
/// Throws ProductNotFoundException if the product doesn't exist.
class GetProductByIdUseCase {
  final ProductRepository _repository;

  const GetProductByIdUseCase(this._repository);

  /// Execute the use case
  /// Returns the product with the given ID
  /// Throws [ProductNotFoundException] if the product is not found
  Future<Product> call(String id) async {
    final product = await _repository.getProductById(id);
    
    if (product == null) {
      throw ProductNotFoundException(id);
    }
    
    return product;
  }
}
