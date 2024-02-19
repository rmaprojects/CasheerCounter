// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  Product(
    String productName,
    int productPrice, {
    String? imageUrl,
  }) {
    RealmObjectBase.set(this, 'productName', productName);
    RealmObjectBase.set(this, 'productPrice', productPrice);
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
  }

  Product._();

  @override
  String get productName =>
      RealmObjectBase.get<String>(this, 'productName') as String;
  @override
  set productName(String value) =>
      RealmObjectBase.set(this, 'productName', value);

  @override
  int get productPrice => RealmObjectBase.get<int>(this, 'productPrice') as int;
  @override
  set productPrice(int value) =>
      RealmObjectBase.set(this, 'productPrice', value);

  @override
  String? get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String?;
  @override
  set imageUrl(String? value) => RealmObjectBase.set(this, 'imageUrl', value);

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObjectBase.getChanges<Product>(this);

  @override
  Product freeze() => RealmObjectBase.freezeObject<Product>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Product._);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('productName', RealmPropertyType.string),
      SchemaProperty('productPrice', RealmPropertyType.int),
      SchemaProperty('imageUrl', RealmPropertyType.string, optional: true),
    ]);
  }
}
