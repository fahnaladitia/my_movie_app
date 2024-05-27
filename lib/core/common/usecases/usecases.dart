abstract class UseCase<T> {
  Future<T> execute();
}

abstract class UseCaseWithParam<T, P> {
  Future<T> execute(P param);
}
