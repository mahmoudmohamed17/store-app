import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/domain/entities/product_entity.dart';

void saveBoxData(List<ProductEntity> products, String boxName) async {
    var box = Hive.box<ProductEntity>(boxName);
   await box.addAll(products);
  }