import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constanst.dart';
import '../../domain/entities/product_entity.dart';

abstract class HomeLocalDataSource {
  List<ProductEntity> getAllProducts();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<ProductEntity> getAllProducts() {
    var box = Hive.box<ProductEntity>(kProductEntityBox);
    return box.values.toList();
  }
}
