import 'package:connect_pets/app/common/error/failure.dart';

class CommonNoInternetConnectionError extends Failure {
  CommonNoInternetConnectionError({message, stack})
      : super(
          errorMessage: message ?? "Sem conexão com a internet",
          stackTrace: stack,
        );
}
