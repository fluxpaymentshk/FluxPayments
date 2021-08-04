import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';
import 'package:flux_payments/models/Reward.dart';
import 'package:flux_payments/models/Story.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/banner.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class DatabaseBaseRepository {
  Future<void> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID});

  Future<List<Map<String, String>>> getServiceProviderCategoryList(
      {required String? billCategoryID});

  Future<List<Map<String, String>>> getBillCategoryList();

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

  Future<double> getFluxPoints({required String? userID});

  Future<Map<String, dynamic>> updateFluxPoints(
      {required String? userID,
      required FluxPointServiceType? appEvent,
      required double? servicePoints,
      required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID});

  Future<Map<String, dynamic>> getUserBillProviderDetails(
      {required String? userID});

  Future<Map<String, dynamic>> getUserRewardDetails({required String? userID});

  Future<Map<String, dynamic>> getSingleTransactionDetails(
      {required String? userID, required String? serviceTransactionID});

  Future<Map<String, dynamic>> getPaymentHistoryProviderWiseDetails(
      {required String? userID});

  Future<Banner> getBannerDetails();

  Future<void> addRewardTransaction(
      {required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? userID,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID});

  Future<String> insertCreditCardDetails(
      {required String creditCardNumber,
      required String expiryDate,
      required String bankName,
      required String cvv,
      required String holderName,
      required String userID,
      required String billProviderID});
  Future<String> insertTelecomDetails(
      {required String phNumber,
      required String name,
      required String providerName,
      required String billCategoryID,
      required String userID,
      required String billProviderID});
  Future<String> insertElectricityBillDetails(
      {required String phNumber,
      required String acHolderName,
      required String acNumber,
      required String billCategoryID,
      required String userID,
      required String billProviderID});
  Future<String> insertInsuranceDetails(
      {required String phNumber,
      required String acHolderName,
      required String acNumber,
      required String billCategoryID,
      required String userID,
      required String billProviderID});

  Future<String> insertBankDetails(
      {required String acHolderName,
      required String accNumber,
      required String bankName,
      required String ifscCode,
      required String userID,
      required String billProviderID});

  Future<String> insertTaxDetails(
      {required double businessRegistrationFee,
      required String shroffAcNumber,
      required String trcAcNumber,
      required String applicantName,
      required String billCategoryID,
      required String userID,
      required String billProviderID});
}

class DatabaseRepository extends DatabaseBaseRepository {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  Future<List<Reward>> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID}) async {
    return await _databaseLambdaService.getUserFavoritesList(userID: userID);
  }

  @override
  Future<List<Map<String, String>>> getServiceProviderCategoryList(
      {required String? billCategoryID}) async {
    return await _databaseLambdaService.getServiceProviderCategoryList(
        billCategoryID: billCategoryID);
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
  Future<Map<String, dynamic>> getPaymentHistoryProviderWiseDetails(
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
  Future<double> getFluxPoints({required String? userID}) async {
    return await _databaseLambdaService.getFluxPoints(userID!);
  }

  @override
  Future<Map<String, dynamic>> updateFluxPoints(
      {required String? userID,
      required FluxPointServiceType? appEvent,
      required double? servicePoints,
      required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID}) async {
    return await _databaseLambdaService.updateFluxPoints(
      userID: userID,
      appEvent: appEvent,
      servicePoints: servicePoints,
      rewardTransID: rewardTransID,
      amount: amount,
      timestamp: timestamp,
      rewardPartnerID: rewardPartnerID,
      rewardID: rewardID,
      shopID: shopID,
    );
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

  @override
  Future<void> addRewardTransaction(
      {required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? userID,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID}) async {
    await _databaseLambdaService.addUserRewardTransaction(
      rewardTransID: rewardTransID,
      amount: amount,
      timestamp: timestamp,
      userID: userID,
      rewardPartnerID: rewardPartnerID,
      rewardID: rewardID,
      shopID: shopID,
    );
  }

  @override
  Future<List<Map<String, String>>> getBillCategoryList() async {
    return await _databaseLambdaService.getBillCategoryList();
  }

  @override
  Future<String> insertBankDetails(
      {required String acHolderName,
      required String accNumber,
      required String bankName,
      required String ifscCode,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertBankDetails(
        acHolderName: acHolderName,
        accNumber: accNumber,
        bankName: bankName,
        ifscCode: ifscCode,
        userID: userID,
        billProviderID: billProviderID);
  }

  @override
  Future<String> insertCreditCardDetails(
      {required String creditCardNumber,
      required String expiryDate,
      required String bankName,
      required String cvv,
      required String holderName,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertCreditCardDetails(
        creditCardNumber: creditCardNumber,
        expiryDate: expiryDate,
        bankName: bankName,
        cvv: cvv,
        holderName: holderName,
        userID: userID,
        billProviderID: billProviderID);
  }

  @override
  Future<String> insertElectricityBillDetails(
      {required String phNumber,
      required String acHolderName,
      required String acNumber,
      required String billCategoryID,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertElectricityBillDetails(
        phNumber: phNumber,
        acHolderName: acHolderName,
        acNumber: acNumber,
        billCategoryID: billCategoryID,
        userID: userID,
        billProviderID: billProviderID);
  }

  @override
  Future<String> insertInsuranceDetails(
      {required String phNumber,
      required String acHolderName,
      required String acNumber,
      required String billCategoryID,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertInsuranceDetails(
        phNumber: phNumber,
        acHolderName: acHolderName,
        acNumber: acNumber,
        billCategoryID: billCategoryID,
        userID: userID,
        billProviderID: billProviderID);
  }

  @override
  Future<String> insertTaxDetails(
      {required double businessRegistrationFee,
      required String shroffAcNumber,
      required String trcAcNumber,
      required String applicantName,
      required String billCategoryID,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertTaxDetails(
        businessRegistrationFee: businessRegistrationFee,
        shroffAcNumber: shroffAcNumber,
        trcAcNumber: trcAcNumber,
        applicantName: applicantName,
        billCategoryID: billCategoryID,
        userID: userID,
        billProviderID: billProviderID);
  }

  @override
  Future<String> insertTelecomDetails(
      {required String phNumber,
      required String name,
      required String providerName,
      required String billCategoryID,
      required String userID,
      required String billProviderID}) async {
    return await _databaseLambdaService.insertTelecomDetails(
        phNumber: phNumber,
        name: name,
        providerName: providerName,
        billCategoryID: billCategoryID,
        userID: userID,
        billProviderID: billProviderID);
  }
}
