import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';

class SharedService {
  static var userData;
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("userToken");

    return isKeyExist;
  }

  static Future loginDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("userToken");
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("userToken");

      userData = await jsonDecode(cacheData.syncData);
      return (cacheData.syncData);
    } else
      return (null);
  }

  static Future<void> setLoginDetails(
    model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "userToken",
      syncData: jsonEncode(model),
    );
    await APICacheManager().addCacheData(cacheDBModel);
    var cacheData = await APICacheManager().getCacheData("userToken");
  }

  static Future<void> setPaymentDetails(
    model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "userToken",
      syncData: jsonEncode(model),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future paymentDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("paymentToken");
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("paymentToken");

      return (cacheData.syncData);
    } else {
      return (null);
    }
  }

  static Future<void> logout() async {
    await APICacheManager().deleteCache("userToken");
    await APICacheManager().emptyCache();
  }
}
