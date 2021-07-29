import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';
import 'package:flux_payments/models/Reward.dart';
import 'package:flux_payments/models/Story.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/banner.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class databaseBaseRepository {
  Future<void> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID});

  Future<List<myCoupons>> getUserCoupons(
      {required int? page,
      required List<myCoupons> coupons,
      required String? userID});

  Future<List<Story>> getStory(
      {required int? page, required List<Story> story});

  Future<void> getCuratedList(
      {required int? page, required List<curatedList> curatedListData});
  Future<List<Map<String, dynamic>>> getRecentPayments(
      {required String UserID});

  Future<Map<String, dynamic>> getPendingServices(
      {required String userID, required String todayDate});

  Future<void> getInternalAdvertiserList(
      {required int? page,
      required List<InternalAdvertisers> internalAdvertisersListData});
  Future<void> getExternalAdvertiserList(
      {required int? page,
      required List<ExternalAdvertisers> externalAdvertisersListData});

  Future<User> getUserDetails({required String? userID});

  Future<Map<String, dynamic>> updateFluxPoints(
      {required String? userID,
      required FluxPointServiceType? appEvent,
      required double? servicePoints});

  Future<Map<String, dynamic>> getUserBillProviderDetails(
      {required String? userID});

  Future<Map<String, dynamic>> getUserRewardDetails({required String? userID});

  Future<Map<String, dynamic>> getSingleTransactionDetails(
      {required String? userID, required String? serviceTransactionID});

  Future<Map<String, dynamic>> getPaymentHistoryProviderWiseDetails(
      {required String? userID});
  Future<Banner> getBannerDetails();
}

class DatabaseRepository extends databaseBaseRepository {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  Future<List<Reward>> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID}) async {
    return await _databaseLambdaService.getUserFavoritesList(userID: userID);
  }

  @override
  Future<List<myCoupons>> getUserCoupons(
      {required int? page,
      required List<myCoupons> coupons,
      required String? userID}) async {
    return await _databaseLambdaService.getUserCouponsList(userID: userID);
  }

  @override
  Future<List<Story>> getStory(
      {required int? page, required List<Story> story}) async {
    return await _databaseLambdaService.getStory();
  }

  @override
  Future<void> getCuratedList(
      {required int? page, required List<curatedList> curatedListData}) async {
    await _databaseLambdaService.getCuratedList(
        page: page, curatedListData: curatedListData);
  }

  @override
  Future<List<Map<String, dynamic>>> getRecentPayments(
      {required String UserID}) async {
    return await _databaseLambdaService.getRecentPayment(userID: UserID);
  }

  @override
  Future<Map<String, Map<String, double>>> getPaymentHistoryProviderWiseDetails(
      {required String? userID}) async {
    return await _databaseLambdaService.getPaymentHistoryProviderWiseDetails(
        userID: userID);
  }

  @override
  Future<Map<String, dynamic>> getSingleTransactionDetails(
      {required String? userID, required String? serviceTransactionID}) async {
    return await _databaseLambdaService.getSingleTransactionDetails(
        userID: userID, serviceTransactionID: serviceTransactionID);
  }

  @override
  Future<Map<String, dynamic>> getUserBillProviderDetails(
      {required String? userID}) async {
    return await _databaseLambdaService.getUserBillProviderDetails(
        userID: userID);
  }

  @override
  Future<User> getUserDetails({required String? userID}) async {
    return await _databaseLambdaService.getUserDetails(userID: userID);
  }

  @override
  Future<Map<String, dynamic>> getUserRewardDetails(
      {required String? userID}) async {
    return await _databaseLambdaService.getUserRewardDetails(userID: userID);
  }

  Future<Banner> getBannerDetails() async {
    return await _databaseLambdaService.getBannerDetails();
  }

  @override
  Future<Map<String, dynamic>> updateFluxPoints(
      {required String? userID,
      required FluxPointServiceType? appEvent,
      required double? servicePoints}) async {
    return await _databaseLambdaService.updateFluxPoints(
        userID: userID, appEvent: appEvent, servicePoints: servicePoints);
  }

  Future<void> getInternalAdvertiserList(
      {required int? page,
      required List<InternalAdvertisers> internalAdvertisersListData}) async {
    return await _databaseLambdaService.getInternalAdvertiserList(
        page: page, internalAdvertisersListData: internalAdvertisersListData);
  }

  Future<void> getExternalAdvertiserList(
      {required int? page,
      required List<ExternalAdvertisers> externalAdvertisersListData}) async {
    return await _databaseLambdaService.getExternalAdvertiserList(
        page: page, ExternalAdvertisersListData: externalAdvertisersListData);
  }

  @override
  Future<Map<String, dynamic>> getPendingServices(
      {required String userID, required String todayDate}) async {
    return await _databaseLambdaService.getPendingServices(
        userID: userID, todayDate: todayDate);
  }
}
