import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/api_failure.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/repos/home_repo.dart';

// use case only used to return a method not to implement it
class GetAllProductsUseCase {
  final HomeRepo _homeRepo;
  GetAllProductsUseCase(this._homeRepo);

  Future<Either<ApiFailure, List<ProductEntity>>> call() async {
    return await _homeRepo.getAllProducts();
  }
}
