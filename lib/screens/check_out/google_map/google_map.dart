import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/check_out_provider.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final LatLng _initalCameraPosition = const LatLng(20.5937, 78.9829);
  late GoogleMapController controller;
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initalCameraPosition,
                ),
                mapType: MapType.normal,
                // onMapCreated:
                //     _onMapCreated, // bu sıkıntı çıkarıyor. Haritayı sürekli konuma götürüyor
                myLocationEnabled: true,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      await location.getLocation().then((value) {
                        setState(() {
                          checkoutProvider.setLocation = value;
                        });
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    color: Constants.appBarColor,
                    shape: const StadiumBorder(),
                    child: const Text("Set Location"),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 15,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                    const SizedBox(width: 10),
                    const Text(
                      'Google Maps',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController value) {
    controller = value;
    location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude!, event.longitude!), zoom: 15),
        ),
      );
    });
  }
}
