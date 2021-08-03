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


