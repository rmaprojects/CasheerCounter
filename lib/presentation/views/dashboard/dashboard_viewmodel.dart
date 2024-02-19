import 'package:casheer_counter/data/repository/casheer_counter_repository_impl.dart';
import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:casheer_counter/domain/repository/casheer_counter_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_viewmodel.g.dart';

@riverpod
DashboardViewModel dashboardViewModel(DashboardViewModelRef ref) {
  return DashboardViewModel(
    repository: ref.watch(casheerCounterRepositoryProvider),
  );
}

class DashboardViewModel extends ChangeNotifier {
  final CasheerCounterRepository repository;
  final List<Product> _productList;
  bool _isEditing;

  DashboardViewModel({
    required this.repository,
  })  : _productList = repository.getProductList().toList(),
        _isEditing = false;

  List<Product> get productList => _productList;
  bool get isEditing => _isEditing;

  void removeProduct(Product product) {
    var isRemovalSuccess = repository.deleteProduct(product);
    if (isRemovalSuccess) {
      notifyListeners();
    }
  }

  void isEditToggle() {
    _isEditing = !_isEditing;
    notifyListeners();
  }
}
