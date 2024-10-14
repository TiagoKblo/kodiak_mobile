import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';

Future<void> login(String email, String password) async {
  try {
    final apiUrl = dotenv.env['API_URL'] ?? '';
    final fullUrl = '$apiUrl/users/login';

    Dio dio = Dio();

    var tempDir = await getTemporaryDirectory();
    var cookieJar = PersistCookieJar(storage: FileStorage(tempDir.path));

    dio.interceptors.add(CookieManager(cookieJar));

    final response = await dio.post(
      fullUrl,
      data: {
        'email': email,
        'password': password
      },
      options: Options(
        headers: { 'Content-Type': 'application/json' }
      )
    );

    if(response.statusCode == 200) {
      print('Login bem-sucedido!');
    } else {
      print('Falha no login!');
    }
  } catch (e) {
    print('Erro ao logar: $e');
  }
}