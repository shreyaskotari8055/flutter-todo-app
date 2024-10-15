class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:4000";
  // static const String baseUrl = "http://localhost:4000";


  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String workspace = baseUrl + "/api/workspace";

  static const String createUser = baseUrl + "/api/profiles";

  static const String createAssetCategory = 'add-asset-category';

  static const String createShoppingListCategory = baseUrl + "/api/lookup";

  static const String getShoppingListCategory = baseUrl + "/api/lookup";

  static const String updateShoppingListCategory = baseUrl + "/api/lookup";

  static const String deleteShoppingListCategory = baseUrl + "/api/lookup";

  static const String createExpenseCategory = baseUrl + "/api/lookup";

  static const String getExpenseCategory = baseUrl + "/api/lookup";

  static const String updateExpenseCategory = baseUrl + "/api/lookup";

  static const String deleteExpenseCategory = baseUrl + "/api/lookup";

}