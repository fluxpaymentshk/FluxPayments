abstract class ServiceProviderState {
  const ServiceProviderState();
}

class ServiceProviderInitialState extends ServiceProviderState {
  const ServiceProviderInitialState();
}

class LoadServiceProviderListState extends ServiceProviderState {
  final List<Map<String, String>> ServiceProviderList;
  const LoadServiceProviderListState({required this.ServiceProviderList});
}

class LoadingServiceProviderListState extends ServiceProviderState {
  const LoadingServiceProviderListState();
}

class ErrorServiceProviderListState extends ServiceProviderState {
  final String message;
  const ErrorServiceProviderListState({required this.message});
}

class LoadServiceCategoryListState extends ServiceProviderState {
  final List<Map<String, String>> ServiceCategoryList;
  const LoadServiceCategoryListState({required this.ServiceCategoryList});
}

class LoadingServiceCategoryListState extends ServiceProviderState {
  const LoadingServiceCategoryListState();
}

class ErrorServiceCategoryListState extends ServiceProviderState {
  final String message;
  const ErrorServiceCategoryListState({required this.message});
}

class InsertedDetailsSuccessfully extends ServiceProviderState {
  const InsertedDetailsSuccessfully();
}

class InsertingDetails extends ServiceProviderState {
  const InsertingDetails();
}

class ErrorInsertDetails extends ServiceProviderState {
  final String message;
  const ErrorInsertDetails({required this.message});
}
