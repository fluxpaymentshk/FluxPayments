abstract class ServiceProviderEvent {
  const ServiceProviderEvent();
}

class GetServiceProviderCategoryDetails extends ServiceProviderEvent {
  final String? billCategoryID;
  const GetServiceProviderCategoryDetails({required this.billCategoryID});
}

class GetServiceCategoryDetails extends ServiceProviderEvent {
  const GetServiceCategoryDetails();
}

class InsertBankDetails extends ServiceProviderEvent {
  final String acHolderName;
  final String accNumber;
  final String bankName;
  final String ifscCode;
  final String userID;
  final String billProviderID;
  const InsertBankDetails(
      {required this.acHolderName,
      required this.accNumber,
      required this.bankName,
      required this.ifscCode,
      required this.userID,
      required this.billProviderID});
}

class InsertCreditCardDetails extends ServiceProviderEvent {
  final String creditCardNumber;
  final String expiryDate;
  final String bankName;
  final String cvv;
  final String holderName;
  final String userID;
  final String billProviderID;
  const InsertCreditCardDetails(
      {required this.creditCardNumber,
      required this.expiryDate,
      required this.bankName,
      required this.cvv,
      required this.holderName,
      required this.userID,
      required this.billProviderID});
}

class InsertElectricityBillDetails extends ServiceProviderEvent {
  final String phNumber;
  final String acHolderName;
  final String acNumber;
  final String billCategoryID;
  final String userID;
  final String billProviderID;
  const InsertElectricityBillDetails(
      {required this.phNumber,
      required this.acHolderName,
      required this.acNumber,
      required this.billCategoryID,
      required this.userID,
      required this.billProviderID});
}

class InsertInsuranceDetails extends ServiceProviderEvent {
  final String phNumber;
  final String acHolderName;
  final String acNumber;
  final String billCategoryID;
  final String userID;
  final String billProviderID;

  const InsertInsuranceDetails(
      {required this.phNumber,
      required this.acHolderName,
      required this.acNumber,
      required this.billCategoryID,
      required this.userID,
      required this.billProviderID});
}

class InsertTaxDetails extends ServiceProviderEvent {
  final double businessRegistrationFee;
  final String shroffAcNumber;
  final String trcAcNumber;
  final String applicantName;
  final String billCategoryID;
  final String userID;
  final String billProviderID;
  const InsertTaxDetails(
      {required this.businessRegistrationFee,
      required this.shroffAcNumber,
      required this.trcAcNumber,
      required this.applicantName,
      required this.billCategoryID,
      required this.userID,
      required this.billProviderID});
}

class InsertTelecomDetails extends ServiceProviderEvent {
  final String phNumber;
  final String name;
  final String providerName;
  final String billCategoryID;
  final String userID;
  final String billProviderID;
  const InsertTelecomDetails(
      {required this.phNumber,
      required this.name,
      required this.providerName,
      required this.billCategoryID,
      required this.userID,
      required this.billProviderID});
}
