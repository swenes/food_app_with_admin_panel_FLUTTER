class DeliveryAddressModel {
  String firstName;
  String lastName;
  String adress;
  String mobileNo;
  String city;
  String town;
  String addressType;

  DeliveryAddressModel(
      {required this.firstName,
      required this.lastName,
      required this.adress,
      required this.mobileNo,
      required this.city,
      required this.town,
      required this.addressType});
}
