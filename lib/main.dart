import 'package:bookley_app/core/utils/bloc_observer.dart';
import 'package:bookley_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookley_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookley_app/features/home/domain/use_cases/fetch_newst_books_use_case.dart';
import 'package:bookley_app/features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookley_app/features/home/presentation/views/manager/newst_books_cubit/newst_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewstBox);

  setupServiceLocator();

  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..getFeaturedBooks();
        }),
        BlocProvider(create: (_) {
          return NewstBooksCubit(
            FetchNewstBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..getNewstBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
