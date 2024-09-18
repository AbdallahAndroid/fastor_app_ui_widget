

class DNSConnectionDomainFailedException implements Exception {
  String message;
  DNSConnectionDomainFailedException( this.message );
}
class ServerMessageException implements Exception {
  String message;
  ServerMessageException( this.message );

  @override
  String toString() {
    return 'ServerMessageException{message: $message}';
  }
}

/// remove cache login when found this
class ServerUnAuthenticationException implements Exception {

}
class InputFieldInvalidException implements Exception {

  String? message;
  Map<String, dynamic>? errors;
  InputFieldInvalidException( {this.message, this.errors});

  @override
  String toString() {
    return 'InputFieldInvalidException{message: $message, errors: $errors}';
  }
}


// class LoginInputFieldInvalidException implements Exception {
//
//   ErrorLogin? errors;
//
//   LoginInputFieldInvalidException( errors);
// }
//
// class CompleteProfileInputFieldInvalidException implements Exception {
//
//   ErrorCompleteProfile? errors;
//
//   Map<String, dynamic> errorBackendJson = Map();
//   CompleteProfileInputFieldInvalidException( this.errors, this.errorBackendJson);
// }