import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_event.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_state.dart';
import 'package:flux_payments/repository/database_repository.dart';

class ServiceProviderBloc
    extends Bloc<ServiceProviderEvent, ServiceProviderState> {
  final DatabaseRepository _databaseRepository;
  ServiceProviderBloc(this._databaseRepository)
      : super(ServiceProviderInitialState());

  @override
  Stream<ServiceProviderState> mapEventToState(
      ServiceProviderEvent event) async* {
    if (event is GetServiceProviderCategoryDetails) {
      try {
        yield LoadingServiceProviderListState();

        List<Map<String, String>> ServiceProviderList =
            await _databaseRepository.getServiceProviderCategoryList(
                billCategoryID: event.billCategoryID);

        print('qqqqqqqqqqqwwwwwwwww-----------------');
        print(ServiceProviderList);

        yield LoadServiceProviderListState(
            ServiceProviderList: ServiceProviderList);
      } catch (e) {
        yield ErrorServiceProviderListState(
            message: 'cannot Load the desired list of Providers');
      }
    }

    if (event is GetServiceCategoryDetails) {
      try {
        yield LoadingServiceCategoryListState();
        List<Map<String, String>> ServiceCategoryList =
            await _databaseRepository.getBillCategoryList();

        print('gfffffffffff');
        print(ServiceCategoryList);
        yield LoadServiceCategoryListState(
            ServiceCategoryList: ServiceCategoryList);
      } catch (e) {
        yield ErrorServiceCategoryListState(
            message: 'cannot Load the categories of different Providers');
      }
    }

    if (event is InsertBankDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertBankDetails(
            acHolderName: event.acHolderName,
            accNumber: event.accNumber,
            bankName: event.bankName,
            ifscCode: event.ifscCode,
            userID: event.userID,
            billProviderID: event.billProviderID);

        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Bank Details');
      }
    }

    if (event is InsertCreditCardDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertCreditCardDetails(
            creditCardNumber: event.creditCardNumber,
            expiryDate: event.expiryDate,
            bankName: event.bankName,
            cvv: event.cvv,
            holderName: event.holderName,
            userID: event.userID,
            billProviderID: event.billProviderID);
        print('{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{[');
        print(res);
        print(res.contains('success'));

        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Credit Card details');
      }
    }

    if (event is InsertElectricityBillDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertElectricityBillDetails(
            phNumber: event.phNumber,
            acHolderName: event.acHolderName,
            acNumber: event.acNumber,
            billCategoryID: event.billCategoryID,
            userID: event.userID,
            billProviderID: event.billProviderID);

        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Electricity Details');
      }
    }

    if (event is InsertInsuranceDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertInsuranceDetails(
            phNumber: event.phNumber,
            acHolderName: event.acHolderName,
            acNumber: event.acNumber,
            billCategoryID: event.billCategoryID,
            userID: event.userID,
            billProviderID: event.billProviderID);

        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Insurance details!');
      }
    }

    if (event is InsertTaxDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertTaxDetails(
            businessRegistrationFee: event.businessRegistrationFee,
            shroffAcNumber: event.shroffAcNumber,
            trcAcNumber: event.trcAcNumber,
            applicantName: event.applicantName,
            billCategoryID: event.billCategoryID,
            userID: event.userID,
            billProviderID: event.billProviderID);

        print('pggggggggggg');
        print(res.contains('success'));
        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Tax Details!');
      }
    }

    if (event is InsertTelecomDetails) {
      try {
        yield InsertingDetails();

        String res = await _databaseRepository.insertTelecomDetails(
            phNumber: event.phNumber,
            name: event.name,
            providerName: event.providerName,
            billCategoryID: event.billCategoryID,
            userID: event.userID,
            billProviderID: event.billProviderID);

        if (res.contains('success')) yield InsertedDetailsSuccessfully();
      } catch (e) {
        yield ErrorInsertDetails(
            message: 'Error occured while inserting Telecom details!');
      }
    }
  }
}
