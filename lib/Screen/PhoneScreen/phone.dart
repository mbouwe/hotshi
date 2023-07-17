import 'package:get/get.dart';
import 'package:country_phone_code_picker/models/country.dart';

class CountryController extends GetxController {
  late Rx<Country> selectedCountry = Country(name: '', countryCode: '', phoneCode: '').obs;
}
