import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:casheer_counter/data/repository/casheer_counter_repository_impl.dart';
import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:casheer_counter/domain/repository/casheer_counter_repository.dart';

part 'add_product_viewmodel.g.dart';

@riverpod
AddProductViewModel addProductViewModel(AddProductViewModelRef ref) {
  return AddProductViewModel(
    repository: ref.watch(casheerCounterRepositoryProvider),
  );
}

class AddProductViewModel extends ChangeNotifier {
  final CasheerCounterRepository _repository;

  AddProductViewModel({required CasheerCounterRepository repository})
      : _repository = repository;

  bool insertProduct(Product newProduct) {
    return _repository.insertProduct(newProduct);
  }
}
