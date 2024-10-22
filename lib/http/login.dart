import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';

Future<User> login(String email, String password) async {
  final apiUrl = dotenv.env['API_URL'] ?? '';
  final fullUrl = '$apiUrl/users/login';

  final Dio dio = Dio();

  var tempDir = await getTemporaryDirectory();
  var cookieJar = PersistCookieJar(storage: FileStorage(tempDir.path));

  dio.interceptors.add(CookieManager(cookieJar));

  try {
    final response = await dio.post(fullUrl,
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}));

    if (response.statusCode == 200) {
      final data = response.data;

      final user = data['user'];

      return User.fromJson(user);
    } else if (response.statusCode == 401) {
      throw Exception('Dados inválidos. Verifique seu e-mail e senha.');
    } else {
      throw Exception('Erro inesperado. Tente novamente mais tarde.');
    }
  } catch (e) {
    print('Erro ao logar: $e');
    throw Exception('Erro inesperado!');
  }
}
