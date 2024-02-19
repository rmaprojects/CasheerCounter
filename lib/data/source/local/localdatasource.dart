// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:realm/realm.dart';
import 'package:casheer_counter/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'localdatasource.g.dart';

@Riverpod(keepAlive: true)
LocalDatasource localDatasource(LocalDatasourceRef ref) {
  return LocalDatasource(realmDb: ref.watch(realmProvider));
}

class LocalDatasource {
  final Realm realmDb;
  const LocalDatasource({
    required this.realmDb,
  });

  bool insertProduct(Product newProduct) {
    try {
      realmDb.write(() => realmDb.add(newProduct));
      return true;
    } catch (e) {
      return false;
    }
  }

  RealmResults<Product> getAllProducts() {
    return realmDb.all<Product>();
  }

  bool updateProduct(Product oldProduct, Product updatedProduct) {
    try {
      realmDb.write(
        () {
          if (oldProduct.imageUrl != null) {
            oldProduct.imageUrl = updatedProduct.imageUrl;
          }
          oldProduct.productName = updatedProduct.productName;
          oldProduct.productPrice = updatedProduct.productPrice;
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  bool deleteProduct(Product product) {
    try {
      realmDb.delete(product);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool deleteAllProducts() {
    try {
      realmDb.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
