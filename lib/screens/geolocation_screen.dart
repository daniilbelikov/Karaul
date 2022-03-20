import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/helpers/icons/geo_icon.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/widgets/bottom_sheet_button.dart';
import 'package:karaul/providers/geolocation_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocationScreen extends StatefulWidget {
  const GeolocationScreen({Key? key}) : super(key: key);

  @override
  _GeolocationScreenState createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: geoProvider.positionState,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            onMapCreated: (GoogleMapController controller) =>
                mapController.complete(controller),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.sp,
                ),
                child: Container(
                  decoration: ConstDecorations.darkDecoration,
                  height: 116.sp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        height: 42.sp,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 16.0,
                            ),
                            Icon(
                              GeoIcon.value,
                              color: Theme.of(context).errorColor,
                              size: 24.0,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 34.sp,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  geoProvider.geoAddressState,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    fontFamily: ConstFonts.regularFont,
                                    fontSize: 10.sp,
                                    height: 1.10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: BottomSheetButton(
                              primary: geoProvider.trackingState
                                  ? Theme.of(context).errorColor
                                  : Theme.of(context).primaryColor,
                              text: geoProvider.trackingState
                                  ? S.of(context).geoStop
                                  : S.of(context).geoTrack,
                              onPressed: () {
                                if (bottomProvider.getContact.hasData &&
                                    bottomProvider.getUser.hasData) {
                                  geoProvider.startTracking(context);
                                } else {
                                  bottomProvider.showCallDialog(context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: BottomSheetButton(
                              primary: Theme.of(context).primaryColor,
                              text: S.of(context).geoSend,
                              onPressed: () {
                                if (bottomProvider.getContact.hasData &&
                                    bottomProvider.getUser.hasData) {
                                  callsProvider.makeSMS(
                                    phone: bottomProvider.getContact.phone,
                                    message: bottomProvider.getContact.message,
                                    address: geoProvider.callAddressState,
                                    context: context,
                                  );
                                } else {
                                  bottomProvider.showCallDialog(context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
