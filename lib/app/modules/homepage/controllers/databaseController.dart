import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../widget/clientController.dart';

class DatabaseController extends ClientController {
  Databases? databases;

  @override
  void onInit() {
    super.onInit();
    // appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "656763461d62a52a2dfa",
        documentId: ID.unique(),
        collectionId: "65676351ab0ef19bc9c3",
        data: map,
        permissions: [
          Permission.create(Role.user("65675cf8412aba191688")),
          Permission.read(Role.user("65675cf8412aba191688")),
          Permission.update(Role.user("65675cf8412aba191688")),
          Permission.delete(Role.user("65675cf8412aba191688")),
        ],
      );
      print("DatabaseController:: storeUserName $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
