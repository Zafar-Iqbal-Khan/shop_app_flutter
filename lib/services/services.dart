import 'package:http/http.dart' as http;
import 'package:shop_app/models/model.dart';

class Services {
  static var client = http.Client();

  static Future<List<Welcome>> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
