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
        yield LoadServiceProviderListState(
            ServiceProviderList: ServiceCategoryList);
      } catch (e) {
        yield ErrorServiceCategoryListState(
            message: 'cannot Load the categories of different Providers');
      }
    }
  }
}
