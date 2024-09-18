import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failure_exceptions.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failures.dart';

/**
  this class to catch exception example simple catch

    *
    try {
    final remotePosts = await remoteDataSource.logIn(request);
    return Right(remotePosts);
    } on InputFieldInvalidException catch ( e) {
    return Left(InputFieldsInvalidFailure( message: e.message, errors: e.errors!));
    } on ServerMessageException catch(  e ) {
    return Left(ServerMessageFailure( e.message));
    } catch ( e ) {
    return Left(ServerMessageFailure("Failed".tra()));
    }
 */
class FailureHandler {


  static Failure chooseFailure(Exception e ) {
    if( e is ServerMessageException ) {
      return ServerMessageFailure( e.message );
    }
    if( e is InputFieldInvalidException ) {
      return InputFieldsInvalidFailure( message: e.message, errors: e.errors  );
    }
    if( e is ServerUnAuthenticationException ) {
      return ServerUnAuthenticationFailure(   );
    }
    if( e is DNSConnectionDomainFailedException ) {
      return DNSConnectionDomainFailedFailure(  message: e.message    );
    }
    return ServerMessageFailure("Failed".tra());
  }
}