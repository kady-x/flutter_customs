//  CUSTOMPHONE  //
// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customBottomSheet.dart';
import 'country_list.dart';
import 'model.dart';

class CustomPhoneForm extends StatefulWidget {
  final String labeltext;
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final Function()? onCountryChanged;
  final String? Function(String?) valid;
  final void Function()? onTapIcon;

  const CustomPhoneForm({
    Key? key,
    this.onTapIcon,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    this.onCountryChanged,
    required this.valid,
    required this.mycontroller,
  }) : super(key: key);

  @override
  State<CustomPhoneForm> createState() => _CustomPhoneFormState();
}

class _CustomPhoneFormState extends State<CustomPhoneForm> {
  TextEditingController searchController = TextEditingController();
  List<CountryCodes> filteredList = [];
  late CountryListController countryListController;
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();
  final filteredListNotifier = ValueNotifier<List<CountryCodes>>([]);

  @override
  void initState() {
    super.initState();
    initializeSelectedCountry();
  }

  void initializeSelectedCountry() async {
    countryListController = CountryListController();
    countryListController.selectedCountryName =
        countryListController.countries.first.name;
    countryListController.selectedCountryCode =
        countryListController.countries.first.code;
    countryListController.selectedCountryFlagPath =
        countryListController.countries.first.flagImagePath;
    countryListController.selectedCountryFormat =
        countryListController.countries.first.phoneformat;
    filteredList = countryListController.countries;
    filteredList = countryListController.countries
        .where((country) => country.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    final SharedPreferences prefs = await sharedPreferences;
    filteredListNotifier.value = List.from(filteredList);
    prefs.setString("CountryCode", countryListController.selectedCountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        validator: widget.valid,
        controller: widget.mycontroller,
        decoration: InputDecoration(
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 9,
              ),
              InkWell(
                onTap: () {
                  customBottomSheet(
                    context,
                    [
                      TextField(
                        controller: searchController,
                        onChanged: (value) {
                          filteredListNotifier.value = List.from(filteredList);
                          setState(
                            () {
                              filteredList = countryListController.countries
                                  .where((country) => country.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                            },
                          );
                        },
                        decoration: const InputDecoration(
                          labelText: 'Search',
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder<List<CountryCodes>>(
                          valueListenable: filteredListNotifier,
                          builder: (context, filteredList, _) {
                            return ListView.builder(
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                CountryCodes country = filteredList[index];
                                return ListTile(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    countryListController.selectedCountryCode =
                                        country.code;
                                    widget.mycontroller!.text = '';
                                    final SharedPreferences prefs =
                                        await sharedPreferences;
                                    setState(
                                      () {
                                        prefs.setString(
                                            "CountryCode",
                                            countryListController
                                                .selectedCountryCode);
                                        final codeIc =
                                            prefs.getString("CountryCode") ??
                                                '';
                                        if (kDebugMode) {
                                          print(codeIc);
                                        }
                                        widget.mycontroller!.text = '';
                                      },
                                    );
                                  },
                                  leading: Image.asset(
                                    country.flagImagePath,
                                    width: 24,
                                    height: 16,
                                  ),
                                  title: Text(country.name),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      countryListController.countries
                          .firstWhere(
                            (country) =>
                                country.code ==
                                countryListController.selectedCountryCode,
                          )
                          .flagImagePath,
                      width: 24,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      countryListController.selectedCountryCode,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "|",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          hintText: widget.hinttext,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              widget.labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: widget.onTapIcon,
            child: Icon(
              widget.iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}

/* Submit Phone */
void phoneSubmition(TextEditingController myController) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final SharedPreferences prefs = sharedPreferences;
  final countryCode = prefs.getString("CountryCode") ?? '';
  myController.text = "$countryCode${myController.text}";
}
