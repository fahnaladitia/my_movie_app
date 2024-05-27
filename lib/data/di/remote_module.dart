part of 'di.dart';

Future<void> remoteModule() async {
  // Dio client for MovieDB API
  getIt.registerSingleton<Dio>(AppRestClient(baseURL: AppConstants.movieDBUrl).dio);

  // Services
  getIt.registerSingleton(MovieService(getIt()));
}
