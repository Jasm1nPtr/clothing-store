import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  final http.Client httpClient;
  late ProductsRepository productsRepository;

  RxBool loading = false.obs;
  RxList<dynamic> products = <dynamic>[].obs;
  RxBool showGrid = false.obs;
  RxString error = ''.obs;

  // Update constructor to accept http.Client
  ProductController({required this.httpClient}) {
    productsRepository = ProductsRepository(httpClient: httpClient);
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    try {
      var productsData = await productsRepository.loadProductsFromApi();
      products.assignAll(productsData);
    } catch (e) {
      print("Error loading products: $e");

      // Check if the error is of type http.ClientException
      if (e is http.ClientException) {
        error('Failed to connect to the API');
      } else {
        error('Failed to load products');
      }
    }
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}

class ProductsRepository {
  final String apiUrl = "https://fakestoreapi.com/products";
  final http.Client httpClient;

  // Update constructor to accept http.Client
  ProductsRepository({required this.httpClient});

  Future<List<dynamic>> loadProductsFromApi() async {
    try {
      final response = await httpClient.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
