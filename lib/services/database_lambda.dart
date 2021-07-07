import 'package:aws_lambda/aws_lambda.dart';

class DatabaseLambdaService {
  Map<String, dynamic> result = {};
  late AWSLambda lambda;
  DatabaseLambdaService() {
    lambda = AWSLambda('ap-southeast-1:5ba0e7c3-a382-4455-9fb7-44b0631c26c0',
        region: 'ap-southeast-1',
        cognitoRegion: 'ap-southeast-1',
        clientConfiguration: <String, dynamic>{
          'ConnectionTimeout': 60000,
          'SocketTimeout': 60000
        });
  }

  Future<Map<String, dynamic>> test() async {
    result = {};
    try {
      result = await lambda
          .callLambda('aurora-serverless-function-referral', <String, dynamic>{
        'key1': ["1234vidd", "flux-vid3"],
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> CouponToTransaction() async {
    result = {};
    try {
      result = await lambda.callLambda('CouponAurora', <String, dynamic>{
        "shopID": "shop1",
        "rewardID": "reward1",
        "myCouponsID": "coupon1",
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }
}
