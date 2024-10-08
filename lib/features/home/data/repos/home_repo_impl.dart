import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/errors/api_failure.dart';
import 'package:store_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:store_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource _homeLocalDataSource;
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepoImpl(this._homeLocalDataSource, this._homeRemoteDataSource);
  @override
  Future<Either<ApiFailure, List<ProductEntity>>> getAllProducts() async {
    List<ProductEntity>? products;
    try {
      products = _homeLocalDataSource.getAllProducts();
      if (products.isNotEmpty) {
        return right(products);
      } else {
        products = await _homeRemoteDataSource.getAllProducts();
        return right(products);
      }
    } on DioException catch (e) {
      return left(ServiceFailure.fromDioException(e));
    } catch (e) {
      return left(
          ServiceFailure(errorMsg: 'Unexpected error, try again later.'));
    }
  }
}
