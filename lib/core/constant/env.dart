var isTestEnvironment = false ;
var isLiveEnvironment = ! isTestEnvironment;

int databaseOfflineVersion = 1;

class env {
  static String countryCodeDefault = "+966";

  static var isTest = isTestEnvironment;
}