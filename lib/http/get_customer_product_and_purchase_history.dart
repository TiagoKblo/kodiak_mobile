import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kodiak/models/customer_product_and_purchase_history.dart';
import 'package:path_provider/path_provider.dart';

Future<CustomerHistory> getCustomerProductAndPurchaseHistory(
    {required String idCustomer}) async {
  final apiUrl = dotenv.env['API_URL'] ?? '';
  final fullUrl = '$apiUrl/customers/$idCustomer/products/history';

  final Dio dio = Dio();

  var tempDir = await getTemporaryDirectory();
  var cookieJar = PersistCookieJar(storage: FileStorage(tempDir.path));
  dio.interceptors.add(CookieManager(cookieJar));

  try {
    final response = await dio.get(fullUrl);

    if (response.statusCode == 200) {
      return CustomerHistory.fromJson(response.data);
    } else {
      throw Exception('Erro ao carregar os dados');
    }
  } on DioException catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}
