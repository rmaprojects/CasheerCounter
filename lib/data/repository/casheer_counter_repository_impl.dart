import 'package:casheer_counter/data/source/local/localdatasource.dart';
import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:casheer_counter/domain/repository/casheer_counter_repository.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'casheer_counter_repository_impl.g.dart';

@Riverpod(keepAlive: true)
CasheerCounterRepository casheerCounterRepository(
  CasheerCounterRepositoryRef ref,
) {
  return CasheerCounterRepositoryImpl(
    localDatasource: ref.watch(localDatasourceProvider),
  );
}

class CasheerCounterRepositoryImpl extends CasheerCounterRepository {
  final LocalDatasource localDatasource;

  CasheerCounterRepositoryImpl({
    required this.localDatasource,
  });

  @override
  bool deleteAllProduct() {
    return localDatasource.deleteAllProducts();
  }

  @override
  bool deleteProduct(Product product) {
    return deleteProduct(product);
  }

  @override
  RealmResults<Product> getProductList() {
    return localDatasource.getAllProducts();
  }

  @override
  bool insertProduct(Product newProduct) {
    return localDatasource.insertProduct(newProduct);
  }

  @override
  bool updateProduct(Product oldProduct, Product updatedProduct) {
    return localDatasource.updateProduct(oldProduct, updatedProduct);
  }
}
