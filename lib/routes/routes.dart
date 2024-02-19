import 'package:casheer_counter/presentation/views/add_product/add_product_scren.dart';
import 'package:casheer_counter/presentation/views/dashboard/dasboard_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: "/addProduct",
        builder: (context, state) => const AddProduct(),
      ),
    ],
  );
}
