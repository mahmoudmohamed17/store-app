import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class SearchRepo {
  List<ProductEntity> getSpecificCategory({required String category});
}
