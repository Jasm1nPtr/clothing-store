import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clothing_store_app/app/widget/clientController.dart';
import 'shoppingcart_models.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Databases? databases;

  init() {
    databases = Databases(client);
  }

  Future<String?> getUserId() async {
    return await _prefs
        .then((SharedPreferences prefs) => prefs.getString('userId'));
  }

  Future<bool> createShoppingCart({
    required String title,
    required String price,
  }) async {
    try {
      // userId DatabaseHelper
      String? userId = await DatabaseHelper.instance.getUserId();

      if (userId != null) {
        // Inisialisasi databases jika belum terinisialisasi
        databases ?? init();

        await databases!.createDocument(
          databaseId: "656763461d62a52a2dfa",
          collectionId: "65676351ab0ef19bc9c3",
          documentId: ID.unique(),
          data: {
            "title": title,
            "price": price,
            "isCheckOut": false,
            "userId": userId,
          },
        );

        return true;
      } else {
        print("Error: userId is null");
        return false;
      }
    } catch (e) {
      print("Error creating shopping cart: $e");
      return false;
    }
  }

  Future<List<ShoppingCartModels>> getShoppingCart() async {
    databases ?? init();
    try {
      String? userId = await getUserId();
      if (userId != null) {
        DocumentList response = await databases!.listDocuments(
          databaseId: "656763461d62a52a2dfa",
          collectionId: "65676351ab0ef19bc9c3",
          queries: [
            Query.equal("userId", userId),
          ],
        );
        return response.documents
            .map(
              (e) => ShoppingCartModels.fromJson(e.data, e.$id),
            )
            .toList();
      } else {
        print("Error: userId is null");
        return [];
      }
    } catch (e) {
      print("Error getting shopping cart: $e");
      return [];
    }
  }

  void updateShoppingCart(ShoppingCartModels update) async {
    databases ?? init();
    try {
      String? userId = await getUserId();
      if (userId != null) {
        await databases!.updateDocument(
          databaseId: "656763461d62a52a2dfa",
          collectionId: "65676351ab0ef19bc9c3",
          documentId: update.id,
          data: {
            "title": update.title,
            "price": update.price,
            "isCheckOut": update.isCheckOut,
            "userId": userId,
          },
        );
      } else {
        print("Error: userId is null");
      }
    } catch (e) {
      print("Error updating shopping cart: $e");
    }
  }

  void deleteShoppingCart(String id) async {
    databases ?? init();
    try {
      String? userId = await getUserId();
      if (userId != null) {
        await databases!.deleteDocument(
          databaseId: "656763461d62a52a2dfa",
          collectionId: "65676351ab0ef19bc9c3",
          documentId: id,
        );
      } else {
        print("Error: userId is null");
      }
    } catch (e) {
      print("Error deleting shopping cart: $e");
    }
  }
}
