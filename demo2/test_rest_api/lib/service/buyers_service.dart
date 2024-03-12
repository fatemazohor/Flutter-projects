import 'package:test_rest_api/model/buyers.dart';

class BuyersService{
  static final String baseUrl = "http://localhost:8098/api/sale";
  static final Map<String, String> headers = {"Content-Type": "application/json"};

  // static Future<List<Buyers>> getBuyer(){
  //   var url = Uri.parse(baseUrl+"/buyers");
  // }

}
