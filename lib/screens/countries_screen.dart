import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/models/country_model.dart';
import 'package:karaul/helpers/icons/kr_icons.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/helpers/icons/search_icons.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  static List<CountriesModel> countries = Countries.list;

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          S.of(context).emergencyTitle,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontFamily: ConstFonts.mediumFont,
            fontSize: 15.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            SearchIcons.cancel,
            color: Theme.of(context).primaryColor,
            size: 22.0,
          ),
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            CountriesModel country = countries[index];
            return Container(
              color: Theme.of(context).cardColor,
              child: ListTile(
                title: Text(
                  country.countryName,
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontFamily: ConstFonts.mediumFont,
                    fontSize: 13.sp,
                  ),
                ),
                subtitle: Text(
                  S.of(context).emergencyNumber + country.countryPhone,
                  style: TextStyle(
                    fontFamily: ConstFonts.regularFont,
                    color: const Color(0xff929292),
                  ),
                ),
                leading: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: ConstDecorations.flagDecoration,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'assets/flags/${country.countryFlag}.png',
                    ),
                  ),
                ),
                trailing: FloatingActionButton(
                  mini: true,
                  elevation: 0.0,
                  heroTag: country.countryFlag,
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () => callsProvider.makeCall(country.countryPhone),
                  child: const Icon(
                    KrIcons.call,
                    size: 18.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
