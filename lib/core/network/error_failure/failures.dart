
abstract class Failure   {}
class ServerFailure extends Failure { }

class ServerMessageFailure extends Failure {
  String message;

  ServerMessageFailure(this.message );

  @override
  String toString() {
    return 'ServerMessageFailure{message: $message }';
  }
}

class ServerUnAuthenticationFailure  extends Failure {}

class DNSConnectionDomainFailedFailure extends Failure {
  String? message;
  DNSConnectionDomainFailedFailure( { this.message});

  @override
  String toString() {
    return 'DNSConnectionDomainFailedFailure{message: $message}';
  }
}

class InputFieldsInvalidFailure extends Failure {

  String? message;
  Map<String, dynamic>? errors;
  InputFieldsInvalidFailure( { this.message, this.errors});

  @override
  String toString() {
    return 'InputFieldsInvalidFailure{message: $message, errors: $errors}';
  }
}

class MissedParameterFailure  extends Failure {
  String? message;
  MissedParameterFailure( this.message );
}
