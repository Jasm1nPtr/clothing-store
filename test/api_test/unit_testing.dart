import 'package:clothing_store_app/app/modules/product_api/controllers/product_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_testing.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Product Controller Tests', () {
    late ProductController productController;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      productController = ProductController(httpClient: mockClient);
    });

    test(
        'loadProductsFromRepo should assign loaded data to products when successful',
        () async {
      final mockResponse = http.Response('{"products": []}', 200);

      // Mocking the http get call for successful response
      when(mockClient.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => mockResponse);

      // Call the method to load products
      await productController.loadProductsFromRepo();

      // Verify loading state
      expect(productController.loading.value, false);

      // Verify products assigned
      expect(productController.products.length, 0);
    });

    test('loadProductsFromRepo should handle API errors', () async {
      //final errorResponse = http.Response('{"error": "API Error"}', 500);

      // Mocking API error
      when(mockClient.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer(
              (_) async => http.Response('{"error": "API Error"}', 500));

      // Call the method to load products
      await productController.loadProductsFromRepo();

      // Verify loading state
      expect(productController.loading.value, false);

      // Verify error message printed
      expect(productController.error.value, isNotNull);
    });
  });
}
