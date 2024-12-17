
abstract class BaseUseCase<T, Params> {
  T call(Params params);
}

abstract class BaseUseCaseNoParams<T > {
  T call( );
}


class NoParams   {

}