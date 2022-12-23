import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_ytm/models/deliver_adress_model.dart';
import 'package:location/location.dart';

class CheckOutProvider with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController town = TextEditingController();

  late LocationData setLocation;
  bool isLoading = false;

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last name is empty");
    } else if (adress.text.isEmpty) {
      Fluttertoast.showToast(msg: "Adress is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile no is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is empty");
    } else if (setLocation.latitude == null) {
      Fluttertoast.showToast(msg: "Set location is empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliverAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "adress": adress.text,
        "mobileNo": mobileNo.text,
        "city": city.text,
        "town": town.text,
        "addressType": myType.toString(),
        "latitude": setLocation.latitude,
        "longitude": setLocation.longitude
      }).then((value) async {
        isLoading = false;

        notifyListeners();
        await Fluttertoast.showToast(msg: "Added your deliver address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
      clearTextFields();
    }
  }

  List<DeliveryAddressModel> deliveryAdressList = [];
  getDeliveryAdressData() async {
    List<DeliveryAddressModel> newList = [];
    DeliveryAddressModel? deliveryAddressModel;
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (data.exists) {
      deliveryAddressModel = DeliveryAddressModel(
          firstName: data.get('firstName'),
          lastName: data.get('lastName'),
          adress: data.get('adress'),
          mobileNo: data.get('mobileNo'),
          city: data.get('city'),
          town: data.get('town'),
          addressType: data.get('addressType'));
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliverAddressList {
    return deliveryAdressList;
  }

  void clearTextFields() {
    firstName.clear();
    lastName.clear();
    adress.clear();
    mobileNo.clear();
    city.clear();
    town.clear();
  }
}
