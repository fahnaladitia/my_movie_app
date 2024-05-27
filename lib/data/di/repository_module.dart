part of 'di.dart';

Future<void> repositoryModule() async {
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(getIt()));
}
