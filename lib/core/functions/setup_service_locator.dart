import 'package:bookley_app/features/search/data/repo/seach_book_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/home_local_data_source.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/data_source/seach_book_remote_datasource.dart';
import '../utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register API service for making HTTP requests to the server
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeLocalDataSource: HomeLocalDataSourceImpl(),
        homeRemoteDataSource:
            HomeRemoteDataSourceImpl(getIt.get<ApiService>())),
  );
  getIt.registerSingleton<SearchBookRepoImpl>(
    SearchBookRepoImpl(
      SearchBookRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
