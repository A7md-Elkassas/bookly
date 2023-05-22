import 'package:bookley_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookley_app/features/home/presentation/views/home_view.dart';
import 'package:bookley_app/features/search/presentation/views/search_view.dart';
import 'package:bookley_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeViewRoute = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: ((context, state) => const SplashView())),
    GoRoute(
        path: kHomeViewRoute, builder: ((context, state) => const HomeView())),
    GoRoute(
        path: kSearchView, builder: ((context, state) => const SearchView())),
    GoRoute(
        path: kBookDetailsView,
        builder: ((context, state) => const BookDetailsView())),
  ]);
}
