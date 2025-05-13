import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:docflow/models/notice.dart';

class NoticeService {
  static const String baseUrl = 'http://localhost:3000/notices';

  Future<List<Notice>> find() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar os avisos');
    }

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Notice.fromJson(json)).toList();
  }

  Future<Notice> getById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Aviso não encontrado');
    }

    return Notice.fromJson(jsonDecode(response.body));
  }
}
