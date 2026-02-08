class ResponseGenerateApplePaySession {
  bool? status;
  String? message;
  DataGenerateApplePaySession? data;

  ResponseGenerateApplePaySession({this.status, this.message, this.data});

  ResponseGenerateApplePaySession.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new DataGenerateApplePaySession.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataGenerateApplePaySession {
  String? apiVersion;
  GatewayResponse? gatewayResponse;
  String? transactionId;

  DataGenerateApplePaySession(
      {this.apiVersion, this.gatewayResponse, this.transactionId});

  DataGenerateApplePaySession.fromJson(Map<String, dynamic> json) {
    apiVersion = json['apiVersion'];
    gatewayResponse = json['gatewayResponse'] != null
        ? new GatewayResponse.fromJson(json['gatewayResponse'])
        : null;
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiVersion'] = this.apiVersion;
    if (this.gatewayResponse != null) {
      data['gatewayResponse'] = this.gatewayResponse!.toJson();
    }
    data['transaction_id'] = this.transactionId;
    return data;
  }
}

class GatewayResponse {
  String? merchant;
  String? result;
  Session? session;

  GatewayResponse({this.merchant, this.result, this.session});

  GatewayResponse.fromJson(Map<String, dynamic> json) {
    merchant = json['merchant'];
    result = json['result'];
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchant'] = this.merchant;
    data['result'] = this.result;
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    return data;
  }
}

class Session {
  String? aes256Key;
  int? authenticationLimit;
  String? id;
  String? updateStatus;
  String? version;

  Session(
      {this.aes256Key,
      this.authenticationLimit,
      this.id,
      this.updateStatus,
      this.version});

  Session.fromJson(Map<String, dynamic> json) {
    aes256Key = json['aes256Key'];
    authenticationLimit = json['authenticationLimit'];
    id = json['id'];
    updateStatus = json['updateStatus'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aes256Key'] = this.aes256Key;
    data['authenticationLimit'] = this.authenticationLimit;
    data['id'] = this.id;
    data['updateStatus'] = this.updateStatus;
    data['version'] = this.version;
    return data;
  }
}
