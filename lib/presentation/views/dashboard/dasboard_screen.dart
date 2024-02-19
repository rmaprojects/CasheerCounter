import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:casheer_counter/presentation/components/product_item.dart';
import 'package:casheer_counter/presentation/components/responsive.dart';
import 'package:casheer_counter/presentation/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    DashboardViewModel viewModel = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Casheer Counter"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => context.push("/addProduct"),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobileView: _mobileView(
          screenSize,
          context,
          viewModel.productList,
        ),
        tabletView: _tabletView(
          screenSize,
          context,
          viewModel.productList,
        ),
      ),
    );
  }

  Widget _tabletView(
    Size screenSize,
    BuildContext context,
    List<Product> productList,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: screenSize.width > ResponsiveLayout.tabletMaxWidth ? 6 : 8,
            child: _listView(context, productList),
          ),
          Expanded(
            flex: screenSize.width > ResponsiveLayout.mobileMaxWidth ? 8 : 10,
            child: _listDetail(),
          ),
        ],
      );
  Widget _mobileView(
    Size screenSize,
    BuildContext context,
    List<Product> productList,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: screenSize.width > ResponsiveLayout.tabletMaxWidth ? 5 : 7,
            child: _listView(context, productList),
          ),
        ],
      );

  Widget _listDetail() => Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.yellow,
        child: const Center(child: Text("")),
      );

  Widget _listView(BuildContext context, List<Product> productList) =>
      (productList.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(36.0),
              child: Center(
                child: Text(
                  "Kamu masih belum menambahkan produk, silahkan tambahkan dahulu",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ResponsiveLayout.isScreenTablet(context) ? 4 : 1,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductItem(
                  productName: productList[index].productName,
                  productPrice: productList[index].productPrice,
                ),
              ),
            );
}
