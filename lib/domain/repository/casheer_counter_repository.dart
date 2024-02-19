import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:realm/realm.dart';

abstract class CasheerCounterRepository {
  RealmResults<Product> getProductList();
  bool insertProduct(Product newProduct);
  bool deleteProduct(Product product);
  bool updateProduct(Product oldProduct, Product updatedProduct);
  bool deleteAllProduct();
}
