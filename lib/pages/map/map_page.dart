import 'dart:async';

import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../model/location_model.dart';
import 'map_utils.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapController = Completer<YandexMapController>();
  var _locationModel = LocationModel();
  var locationName = '';
  final prefs = PrefHelper();

  @override
  void initState() {
    handleLocationPermission();
    prefs.setIsFirst(false);
    super.initState();
  }

  Future<void> getCameraPos() async {
    (await mapController.future).getCameraPosition().then((value) {
      getPlaceMark(value.target.latitude, value.target.longitude);
    });
  }

  Future<void> move() async {
    var controller = await mapController.future;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      controller.moveCamera(
          animation:
              const MapAnimation(type: MapAnimationType.linear, duration: 1),
          CameraUpdate.newCameraPosition(CameraPosition(
              target: Point(
                  latitude: position.latitude,
                  longitude: position.longitude))));
    }).catchError((e) {
      //
    });
    getCameraPos();
  }

  Future<void> getPlaceMark(double lat, double long) async {
    getAddressFromLatLong(lat, long, (locationModel) {
      _locationModel = locationModel;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    locationName = _locationModel.countryName.isEmpty ? '': '${_locationModel.countryName}, ${_locationModel.regionName}, ${_locationModel.cityName}';
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(children: [
                YandexMap(
                  onCameraPositionChanged: (cameraPosition, reason, finished) {
                    if (finished) {
                      getCameraPos();
                    }
                  },
                  onMapCreated: (controller) {
                    mapController.complete(controller);
                    move();
                  },
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SvgPicture.asset('assets/images/pin.svg',
                          height: 50)),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      move();
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.navigation,
                          color: Color(0xff51267D),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
        Column(
          children: [
            Expanded(child: Container()),
            Material(
              elevation: 10,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25 + 20,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 18, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yetkazib berish manzili',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.paperplane, size: 25),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  locationName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Material(
                          color: const Color(0xff51267D),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              // Navigator.push(context, CupertinoPageRoute(
                              //   builder: (context) {
                              //     return ConfirmPage(
                              //       pinnedLocation: locationName,
                              //     );
                              //   },
                              // ));

                              prefs.setLocation(locationName.replaceAll('Uzbekistan', 'O\'zbekiston'));
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage(),));
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: const Text(
                                'Tasdiqlang',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
