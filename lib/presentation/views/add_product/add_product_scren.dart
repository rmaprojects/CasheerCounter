import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:casheer_counter/presentation/components/responsive.dart';
import 'package:casheer_counter/presentation/views/add_product/add_product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class AddProduct extends ConsumerStatefulWidget {
  const AddProduct({super.key});

  @override
  AddProductState createState() => AddProductState();
}

class AddProductState extends ConsumerState<AddProduct> {
  late TextEditingController _productNameTextController;
  late TextEditingController _productPriceTextController;

  @override
  void initState() {
    super.initState();

    _productNameTextController = TextEditingController();
    _productPriceTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _productNameTextController.dispose();
    _productPriceTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AddProductViewModel viewModel =
        ref.watch(addProductViewModelProvider);
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ResponsiveLayout(
        mobileView: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _imagePreview(),
            const SizedBox(height: 12),
            _productForm(
              () => _onSaveProduct(
                (product) => viewModel.insertProduct(product),
                () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Gagal menambahkan produk")),
                ),
              ),
            ),
          ],
        ),
        tabletView: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: screenSize.width > ResponsiveLayout.mobileMaxWidth ? 8 : 10,
              child: _imagePreview(),
            ),
            Expanded(
              flex: screenSize.width > ResponsiveLayout.tabletMaxWidth ? 6 : 8,
              child: _productForm(() {
                if (_productNameTextController.text.isEmpty &&
                    _productPriceTextController.text.isEmpty) {
                  return;
                }
                _onSaveProduct(
                  (product) => viewModel.insertProduct(product),
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Gagal menambahkan produk")),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePreview() => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Placeholder(),
        ),
      );

  Widget _productForm(
    Function() onSaveProduct,
  ) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productNameTextController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kamu belum memasukkan nama barangnya";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("Nama Barang"),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kamu belum memasukkan harga barangnya";
                    }
                    return null;
                  },
                  controller: _productPriceTextController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("Harga Barang"),
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefix: const Text("Rp. "),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => onSaveProduct(),
                        icon: const Icon(Icons.save),
                        label: const Text("Simpan Barang"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  void _onSaveProduct(
    bool Function(Product) insertProduct,
    Function() showSnackbar,
  ) {
    final isInsertSuccess = insertProduct(
      Product(
        _productNameTextController.text,
        int.parse(_productPriceTextController.text),
      ),
    );
    if (isInsertSuccess) {
      context.pop();
    } else {
      showSnackbar();
    }
  }
}
