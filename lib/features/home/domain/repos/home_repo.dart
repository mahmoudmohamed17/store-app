import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/api_failure.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, List<ProductEntity>>> getAllProducts();
}
