
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client =Client();

  @override
  void onInit(){
    super.onInit();
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65662d04e29864c2475d";
    client.setEndpoint(endPoint).setProject(projectID).setSelfSigned(status: true);
  }
}
