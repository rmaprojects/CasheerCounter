import 'package:realm/realm.dart';

part 'product.g.dart';

@RealmModel()
class _Product {
  late String productName;
  late int productPrice;
  String? imageUrl;
}
