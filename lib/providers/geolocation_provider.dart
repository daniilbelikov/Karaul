import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocationProvider with ChangeNotifier {
  CameraPosition? currentPosition;
  String? currentAddress;
  Timer? timer;

  bool isTracking = false;
  CameraPosition defaultPosition = const CameraPosition(
    target: LatLng(55.752391, 37.617001),
  );

  get geoAddressState => currentAddress ?? ConstTexts.determineLocation;
  get callAddressState => currentAddress ?? ConstTexts.determineUnknow;
  get positionState => currentPosition ?? defaultPosition;
  get trackingState => isTracking;

  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final address = placemarks.first;

    currentPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );

    currentAddress = address.postalCode! +
        ', ' +
        address.country! +
        ', ' +
        address.administrativeArea! +
        ', ' +
        address.locality! +
        ', ' +
        address.street! +
        ', ' +
        address.name!;
  }

  void startTracking(BuildContext context) {
    if (isTracking) {
      isTracking = false;
      timerSendEmail(isTracking, context);
      notifyListeners();
    } else {
      isTracking = true;
      timerSendEmail(isTracking, context);
      notifyListeners();
    }
  }

  void timerSendEmail(
    bool isTracking,
    BuildContext context,
  ) {
    if (isTracking) {
      timer = Timer.periodic(
        const Duration(seconds: 30),
        (timer) {
          final callsProvider = Provider.of<CallsProvider>(
            context,
            listen: false,
          );
          final geoProvider = Provider.of<GeolocationProvider>(
            context,
            listen: false,
          );
          final bottomProvider = Provider.of<BottomSheetProvider>(
            context,
            listen: false,
          );

          geoProvider.getCurrentLocation();

          callsProvider.sendEmail(
            context: context,
            phone: S.of(context).nine,
            userName: bottomProvider.getUser.fullname,
            location: geoProvider.callAddressState,
            subject: S.of(context).emergencySubject,
            toContactName: bottomProvider.getContact.fullname,
            toContactAddress: bottomProvider.getContact.email,
          );
        },
      );
    } else {
      timer?.cancel();
    }
  }
}
