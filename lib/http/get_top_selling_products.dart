import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kodiak/models/top_selling_products.dart';
import 'package:path_provider/path_provider.dart';

Future<TopSellingProducts> getTopSellingProducts() async {
  final apiUrl = dotenv.env['API_URL'] ?? '';
  final fullUrl = '$apiUrl/sales/top/selling/products';

  final Dio dio = Dio();

  var tempDir = await getTemporaryDirectory();
  var cookieJar = PersistCookieJar(storage: FileStorage(tempDir.path));
  dio.interceptors.add(CookieManager(cookieJar));

  try {
    final response = await dio.get(fullUrl);

    if (response.statusCode == 200) {
      return TopSellingProducts.fromJson(response.data);
    } else {
      throw Exception('Erro ao carregar os produtos');
    }
  } on DioException catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}
