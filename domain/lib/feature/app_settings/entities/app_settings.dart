class AppSettings {
  int appID;
  String appCode;
  String channelCode;
  String baseCurrency;
  int numberDecimalPlaces;
  int txnExpiryTime;
  bool vatEnabled;
  bool defaultProdEnabled;
  bool welcomeEnabled;
  bool sandboxEnabled;
  String iosVersion;
  String androidVersion;
  String paymentUrl;
  String paymentReturnUrl;

  AppSettings({
    required this.appID,
    required this.appCode,
    required this.channelCode,
    required this.baseCurrency,
    required this.numberDecimalPlaces,
    required this.txnExpiryTime,
    required this.vatEnabled,
    required this.defaultProdEnabled,
    required this.welcomeEnabled,
    required this.sandboxEnabled,
    required this.iosVersion,
    required this.androidVersion,
    required this.paymentUrl,
    required this.paymentReturnUrl,
  });
}
