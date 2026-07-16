import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<int> addTwoArrayInteger(
  List<int> var1,
  List<int> var2,
) {
  List<int> result = []
    ..addAll(var1)
    ..addAll(var2);
  return result;
}

DateTime presentDateFromZerotime() {
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime getDateFromZerotime(DateTime date) {
  DateTime now = date;
  return DateTime(now.year, now.month, now.day);
}

String? getDailCode(String? countryName) {
  if (countryName == null) {
    return null;
  }
  final countryInfoJson = {
    "Afghanistan": {"dial_code": "93", "code": "AF"},
    "Aland Islands": {"dial_code": "358", "code": "AX"},
    "Albania": {"dial_code": "355", "code": "AL"},
    "Algeria": {"dial_code": "213", "code": "DZ"},
    "AmericanSamoa": {"dial_code": "1684", "code": "AS"},
    "Andorra": {"dial_code": "376", "code": "AD"},
    "Angola": {"dial_code": "244", "code": "AO"},
    "Anguilla": {"dial_code": "1264", "code": "AI"},
    "Antarctica": {"dial_code": "672", "code": "AQ"},
    "Antigua and Barbuda": {"dial_code": "1268", "code": "AG"},
    "Argentina": {"dial_code": "54", "code": "AR"},
    "Armenia": {"dial_code": "374", "code": "AM"},
    "Aruba": {"dial_code": "297", "code": "AW"},
    "Australia": {"dial_code": "61", "code": "AU"},
    "Austria": {"dial_code": "43", "code": "AT"},
    "Azerbaijan": {"dial_code": "994", "code": "AZ"},
    "Bahamas": {"dial_code": "1242", "code": "BS"},
    "Bahrain": {"dial_code": "973", "code": "BH"},
    "Bangladesh": {"dial_code": "880", "code": "BD"},
    "Barbados": {"dial_code": "1246", "code": "BB"},
    "Belarus": {"dial_code": "375", "code": "BY"},
    "Belgium": {"dial_code": "32", "code": "BE"},
    "Belize": {"dial_code": "501", "code": "BZ"},
    "Benin": {"dial_code": "229", "code": "BJ"},
    "Bermuda": {"dial_code": "1441", "code": "BM"},
    "Bhutan": {"dial_code": "975", "code": "BT"},
    "Bolivia, Plurinational State of": {"dial_code": "591", "code": "BO"},
    "Bosnia and Herzegovina": {"dial_code": "387", "code": "BA"},
    "Botswana": {"dial_code": "267", "code": "BW"},
    "Brazil": {"dial_code": "55", "code": "BR"},
    "British Indian Ocean Territory": {"dial_code": "246", "code": "IO"},
    "Brunei Darussalam": {"dial_code": "673", "code": "BN"},
    "Bulgaria": {"dial_code": "359", "code": "BG"},
    "Burkina Faso": {"dial_code": "226", "code": "BF"},
    "Burundi": {"dial_code": "257", "code": "BI"},
    "Cambodia": {"dial_code": "855", "code": "KH"},
    "Cameroon": {"dial_code": "237", "code": "CM"},
    "Canada": {"dial_code": "1", "code": "CA"},
    "Cape Verde": {"dial_code": "238", "code": "CV"},
    "Cayman Islands": {"dial_code": " 345", "code": "KY"},
    "Central African Republic": {"dial_code": "236", "code": "CF"},
    "Chad": {"dial_code": "235", "code": "TD"},
    "Chile": {"dial_code": "56", "code": "CL"},
    "China": {"dial_code": "86", "code": "CN"},
    "Christmas Island": {"dial_code": "61", "code": "CX"},
    "Cocos (Keeling) Islands": {"dial_code": "61", "code": "CC"},
    "Colombia": {"dial_code": "57", "code": "CO"},
    "Comoros": {"dial_code": "269", "code": "KM"},
    "Congo": {"dial_code": "242", "code": "CG"},
    "Congo, The Democratic Republic of the Congo": {
      "dial_code": "243",
      "code": "CD"
    },
    "Cook Islands": {"dial_code": "682", "code": "CK"},
    "Costa Rica": {"dial_code": "506", "code": "CR"},
    "Cote d'Ivoire": {"dial_code": "225", "code": "CI"},
    "Croatia": {"dial_code": "385", "code": "HR"},
    "Cuba": {"dial_code": "53", "code": "CU"},
    "Cyprus": {"dial_code": "357", "code": "CY"},
    "Czech Republic": {"dial_code": "420", "code": "CZ"},
    "Denmark": {"dial_code": "45", "code": "DK"},
    "Djibouti": {"dial_code": "253", "code": "DJ"},
    "Dominica": {"dial_code": "1767", "code": "DM"},
    "Dominican Republic": {"dial_code": "1849", "code": "DO"},
    "Ecuador": {"dial_code": "593", "code": "EC"},
    "Egypt": {"dial_code": "20", "code": "EG"},
    "El Salvador": {"dial_code": "503", "code": "SV"},
    "Equatorial Guinea": {"dial_code": "240", "code": "GQ"},
    "Eritrea": {"dial_code": "291", "code": "ER"},
    "Estonia": {"dial_code": "372", "code": "EE"},
    "Ethiopia": {"dial_code": "251", "code": "ET"},
    "Falkland Islands (Malvinas)": {"dial_code": "500", "code": "FK"},
    "Faroe Islands": {"dial_code": "298", "code": "FO"},
    "Fiji": {"dial_code": "679", "code": "FJ"},
    "Finland": {"dial_code": "358", "code": "FI"},
    "France": {"dial_code": "33", "code": "FR"},
    "French Guiana": {"dial_code": "594", "code": "GF"},
    "French Polynesia": {"dial_code": "689", "code": "PF"},
    "Gabon": {"dial_code": "241", "code": "GA"},
    "Gambia": {"dial_code": "220", "code": "GM"},
    "Georgia": {"dial_code": "995", "code": "GE"},
    "Germany": {"dial_code": "49", "code": "DE"},
    "Ghana": {"dial_code": "233", "code": "GH"},
    "Gibraltar": {"dial_code": "350", "code": "GI"},
    "Greece": {"dial_code": "30", "code": "GR"},
    "Greenland": {"dial_code": "299", "code": "GL"},
    "Grenada": {"dial_code": "1473", "code": "GD"},
    "Guadeloupe": {"dial_code": "590", "code": "GP"},
    "Guam": {"dial_code": "1671", "code": "GU"},
    "Guatemala": {"dial_code": "502", "code": "GT"},
    "Guernsey": {"dial_code": "44", "code": "GG"},
    "Guinea": {"dial_code": "224", "code": "GN"},
    "Guinea-Bissau": {"dial_code": "245", "code": "GW"},
    "Guyana": {"dial_code": "595", "code": "GY"},
    "Haiti": {"dial_code": "509", "code": "HT"},
    "Holy See (Vatican City State)": {"dial_code": "379", "code": "VA"},
    "Honduras": {"dial_code": "504", "code": "HN"},
    "Hong Kong": {"dial_code": "852", "code": "HK"},
    "Hungary": {"dial_code": "36", "code": "HU"},
    "Iceland": {"dial_code": "354", "code": "IS"},
    "India": {"dial_code": "91", "code": "IN"},
    "Indonesia": {"dial_code": "62", "code": "ID"},
    "Iran, Islamic Republic of Persian Gulf": {"dial_code": "98", "code": "IR"},
    "Iraq": {"dial_code": "964", "code": "IQ"},
    "Ireland": {"dial_code": "353", "code": "IE"},
    "Isle of Man": {"dial_code": "44", "code": "IM"},
    "Israel": {"dial_code": "972", "code": "IL"},
    "Italy": {"dial_code": "39", "code": "IT"},
    "Jamaica": {"dial_code": "1876", "code": "JM"},
    "Japan": {"dial_code": "81", "code": "JP"},
    "Jersey": {"dial_code": "44", "code": "JE"},
    "Jordan": {"dial_code": "962", "code": "JO"},
    "Kazakhstan": {"dial_code": "77", "code": "KZ"},
    "Kenya": {"dial_code": "254", "code": "KE"},
    "Kiribati": {"dial_code": "686", "code": "KI"},
    "Korea, Democratic People's Republic of Korea": {
      "dial_code": "850",
      "code": "KP"
    },
    "Korea, Republic of South Korea": {"dial_code": "82", "code": "KR"},
    "Kuwait": {"dial_code": "965", "code": "KW"},
    "Kyrgyzstan": {"dial_code": "996", "code": "KG"},
    "Laos": {"dial_code": "856", "code": "LA"},
    "Latvia": {"dial_code": "371", "code": "LV"},
    "Lebanon": {"dial_code": "961", "code": "LB"},
    "Lesotho": {"dial_code": "266", "code": "LS"},
    "Liberia": {"dial_code": "231", "code": "LR"},
    "Libyan Arab Jamahiriya": {"dial_code": "218", "code": "LY"},
    "Liechtenstein": {"dial_code": "423", "code": "LI"},
    "Lithuania": {"dial_code": "370", "code": "LT"},
    "Luxembourg": {"dial_code": "352", "code": "LU"},
    "Macao": {"dial_code": "853", "code": "MO"},
    "Macedonia": {"dial_code": "389", "code": "MK"},
    "Madagascar": {"dial_code": "261", "code": "MG"},
    "Malawi": {"dial_code": "265", "code": "MW"},
    "Malaysia": {"dial_code": "60", "code": "MY"},
    "Maldives": {"dial_code": "960", "code": "MV"},
    "Mali": {"dial_code": "223", "code": "ML"},
    "Malta": {"dial_code": "356", "code": "MT"},
    "Marshall Islands": {"dial_code": "692", "code": "MH"},
    "Martinique": {"dial_code": "596", "code": "MQ"},
    "Mauritania": {"dial_code": "222", "code": "MR"},
    "Mauritius": {"dial_code": "230", "code": "MU"},
    "Mayotte": {"dial_code": "262", "code": "YT"},
    "Mexico": {"dial_code": "52", "code": "MX"},
    "Micronesia, Federated States of Micronesia": {
      "dial_code": "691",
      "code": "FM"
    },
    "Moldova": {"dial_code": "373", "code": "MD"},
    "Monaco": {"dial_code": "377", "code": "MC"},
    "Mongolia": {"dial_code": "976", "code": "MN"},
    "Montenegro": {"dial_code": "382", "code": "ME"},
    "Montserrat": {"dial_code": "1664", "code": "MS"},
    "Morocco": {"dial_code": "212", "code": "MA"},
    "Mozambique": {"dial_code": "258", "code": "MZ"},
    "Myanmar": {"dial_code": "95", "code": "MM"},
    "Namibia": {"dial_code": "264", "code": "NA"},
    "Nauru": {"dial_code": "674", "code": "NR"},
    "Nepal": {"dial_code": "977", "code": "NP"},
    "Netherlands": {"dial_code": "31", "code": "NL"},
    "Netherlands Antilles": {"dial_code": "599", "code": "AN"},
    "New Caledonia": {"dial_code": "687", "code": "NC"},
    "New Zealand": {"dial_code": "64", "code": "NZ"},
    "Nicaragua": {"dial_code": "505", "code": "NI"},
    "Niger": {"dial_code": "227", "code": "NE"},
    "Nigeria": {"dial_code": "234", "code": "NG"},
    "Niue": {"dial_code": "683", "code": "NU"},
    "Norfolk Island": {"dial_code": "672", "code": "NF"},
    "Northern Mariana Islands": {"dial_code": "1670", "code": "MP"},
    "Norway": {"dial_code": "47", "code": "NO"},
    "Oman": {"dial_code": "968", "code": "OM"},
    "Pakistan": {"dial_code": "92", "code": "PK"},
    "Palau": {"dial_code": "680", "code": "PW"},
    "Palestinian Territory, Occupied": {"dial_code": "970", "code": "PS"},
    "Panama": {"dial_code": "507", "code": "PA"},
    "Papua New Guinea": {"dial_code": "675", "code": "PG"},
    "Paraguay": {"dial_code": "595", "code": "PY"},
    "Peru": {"dial_code": "51", "code": "PE"},
    "Philippines": {"dial_code": "63", "code": "PH"},
    "Pitcairn": {"dial_code": "872", "code": "PN"},
    "Poland": {"dial_code": "48", "code": "PL"},
    "Portugal": {"dial_code": "351", "code": "PT"},
    "Puerto Rico": {"dial_code": "1939", "code": "PR"},
    "Qatar": {"dial_code": "974", "code": "QA"},
    "Romania": {"dial_code": "40", "code": "RO"},
    "Russia": {"dial_code": "7", "code": "RU"},
    "Rwanda": {"dial_code": "250", "code": "RW"},
    "Reunion": {"dial_code": "262", "code": "RE"},
    "Saint Barthelemy": {"dial_code": "590", "code": "BL"},
    "Saint Helena, Ascension and Tristan Da Cunha": {
      "dial_code": "290",
      "code": "SH"
    },
    "Saint Kitts and Nevis": {"dial_code": "1869", "code": "KN"},
    "Saint Lucia": {"dial_code": "1758", "code": "LC"},
    "Saint Martin": {"dial_code": "590", "code": "MF"},
    "Saint Pierre and Miquelon": {"dial_code": "508", "code": "PM"},
    "Saint Vincent and the Grenadines": {"dial_code": "1784", "code": "VC"},
    "Samoa": {"dial_code": "685", "code": "WS"},
    "San Marino": {"dial_code": "378", "code": "SM"},
    "Sao Tome and Principe": {"dial_code": "239", "code": "ST"},
    "Saudi Arabia": {"dial_code": "966", "code": "SA"},
    "Senegal": {"dial_code": "221", "code": "SN"},
    "Serbia": {"dial_code": "381", "code": "RS"},
    "Seychelles": {"dial_code": "248", "code": "SC"},
    "Sierra Leone": {"dial_code": "232", "code": "SL"},
    "Singapore": {"dial_code": "65", "code": "SG"},
    "Slovakia": {"dial_code": "421", "code": "SK"},
    "Slovenia": {"dial_code": "386", "code": "SI"},
    "Solomon Islands": {"dial_code": "677", "code": "SB"},
    "Somalia": {"dial_code": "252", "code": "SO"},
    "South Africa": {"dial_code": "27", "code": "ZA"},
    "South Sudan": {"dial_code": "211", "code": "SS"},
    "South Georgia and the South Sandwich Islands": {
      "dial_code": "500",
      "code": "GS"
    },
    "Spain": {"dial_code": "34", "code": "ES"},
    "Sri Lanka": {"dial_code": "94", "code": "LK"},
    "Sudan": {"dial_code": "249", "code": "SD"},
    "Suriname": {"dial_code": "597", "code": "SR"},
    "Svalbard and Jan Mayen": {"dial_code": "47", "code": "SJ"},
    "Swaziland": {"dial_code": "268", "code": "SZ"},
    "Sweden": {"dial_code": "46", "code": "SE"},
    "Switzerland": {"dial_code": "41", "code": "CH"},
    "Syrian Arab Republic": {"dial_code": "963", "code": "SY"},
    "Taiwan": {"dial_code": "886", "code": "TW"},
    "Tajikistan": {"dial_code": "992", "code": "TJ"},
    "Tanzania, United Republic of Tanzania": {"dial_code": "255", "code": "TZ"},
    "Thailand": {"dial_code": "66", "code": "TH"},
    "Timor-Leste": {"dial_code": "670", "code": "TL"},
    "Togo": {"dial_code": "228", "code": "TG"},
    "Tokelau": {"dial_code": "690", "code": "TK"},
    "Tonga": {"dial_code": "676", "code": "TO"},
    "Trinidad and Tobago": {"dial_code": "1868", "code": "TT"},
    "Tunisia": {"dial_code": "216", "code": "TN"},
    "Turkey": {"dial_code": "90", "code": "TR"},
    "Turkmenistan": {"dial_code": "993", "code": "TM"},
    "Turks and Caicos Islands": {"dial_code": "1649", "code": "TC"},
    "Tuvalu": {"dial_code": "688", "code": "TV"},
    "Uganda": {"dial_code": "256", "code": "UG"},
    "Ukraine": {"dial_code": "380", "code": "UA"},
    "United Arab Emirates": {"dial_code": "971", "code": "AE"},
    "United Kingdom": {"dial_code": "44", "code": "GB"},
    "United States": {"dial_code": "1", "code": "US"},
    "Uruguay": {"dial_code": "598", "code": "UY"},
    "Uzbekistan": {"dial_code": "998", "code": "UZ"},
    "Vanuatu": {"dial_code": "678", "code": "VU"},
    "Venezuela, Bolivarian Republic of Venezuela": {
      "dial_code": "58",
      "code": "VE"
    },
    "Vietnam": {"dial_code": "84", "code": "VN"},
    "Virgin Islands, British": {"dial_code": "1284", "code": "VG"},
    "Virgin Islands, U.S.": {"dial_code": "1340", "code": "VI"},
    "Wallis and Futuna": {"dial_code": "681", "code": "WF"},
    "Yemen": {"dial_code": "967", "code": "YE"},
    "Zambia": {"dial_code": "260", "code": "ZM"},
    "Zimbabwe": {"dial_code": "263", "code": "ZW"}
  };

  final countryDialCode = countryInfoJson[countryName]?["dial_code"];

  if (countryDialCode != null) {
    return countryDialCode;
  }

  return null;
}

DateTime? getFeatureTimeViaAddHurMin(
  DateTime date,
  int hur,
  int min,
) {
  DateTime futureTime = date.add(Duration(hours: hur));
  futureTime = futureTime.add(Duration(minutes: min));
  return futureTime;
}

int? getPhoneLength(String? countryName) {
  if (countryName == null) {
    return null;
  }
  final countryInfoJson = {
    "Afghanistan": {"phone_length": "9"},
    "Albania": {"phone_length": "8-9"},
    "Algeria": {"phone_length": "9"},
    "Andorra": {"phone_length": "6"},
    "Angola": {"phone_length": "9"},
    "Argentina": {"phone_length": "10"},
    "Armenia": {"phone_length": "8"},
    "Australia": {"phone_length": "9"},
    "Austria": {"phone_length": "10"},
    "Azerbaijan": {"phone_length": "9"},
    "Bahrain": {"phone_length": "8"},
    "Bangladesh": {"phone_length": "10"},
    "Belarus": {"phone_length": "9"},
    "Belgium": {"phone_length": "8-9"},
    "Belize": {"phone_length": "7"},
    "Benin": {"phone_length": "8"},
    "Bhutan": {"phone_length": "7-8"},
    "Bolivia": {"phone_length": "8"},
    "Bosnia and Herzegovina": {"phone_length": "8"},
    "Botswana": {"phone_length": "7-8"},
    "Brazil": {"phone_length": "10-11"},
    "Bulgaria": {"phone_length": "7-9"},
    "Burkina Faso": {"phone_length": "8"},
    "Burundi": {"phone_length": "8"},
    "Cambodia": {"phone_length": "8-9"},
    "Cameroon": {"phone_length": "8"},
    "Canada": {"phone_length": "10"},
    "Chile": {"phone_length": "9"},
    "China": {"phone_length": "11"},
    "Colombia": {"phone_length": "10"},
    "Cuba": {"phone_length": "8"},
    "Denmark": {"phone_length": "8"},
    "Egypt": {"phone_length": "10"},
    "France": {"phone_length": "9"},
    "Germany": {"phone_length": "10-11"},
    "Greece": {"phone_length": "10"},
    "India": {"phone_length": "10"},
    "Indonesia": {"phone_length": "9-11"},
    "Iran": {"phone_length": "10"},
    "Iraq": {"phone_length": "10"},
    "Ireland": {"phone_length": "9"},
    "Israel": {"phone_length": "9"},
    "Italy": {"phone_length": "9-10"},
    "Japan": {"phone_length": "10"},
    "Jordan": {"phone_length": "9"},
    "Kazakhstan": {"phone_length": "10"},
    "Kenya": {"phone_length": "9"},
    "Kuwait": {"phone_length": "8"},
    "Lebanon": {"phone_length": "8"},
    "Malaysia": {"phone_length": "9"},
    "Mexico": {"phone_length": "10"},
    "Morocco": {"phone_length": "9"},
    "Netherlands": {"phone_length": "9"},
    "New Zealand": {"phone_length": "8-10"},
    "Nigeria": {"phone_length": "10"},
    "Norway": {"phone_length": "8"},
    "Pakistan": {"phone_length": "10"},
    "Peru": {"phone_length": "9"},
    "Philippines": {"phone_length": "9-10"},
    "Poland": {"phone_length": "9"},
    "Portugal": {"phone_length": "9"},
    "Qatar": {"phone_length": "8"},
    "Romania": {"phone_length": "9"},
    "Russia": {"phone_length": "10"},
    "Saudi Arabia": {"phone_length": "9"},
    "Singapore": {"phone_length": "8"},
    "South Africa": {"phone_length": "9"},
    "South Korea": {"phone_length": "9-10"},
    "Spain": {"phone_length": "9"},
    "Sweden": {"phone_length": "7-10"},
    "Switzerland": {"phone_length": "9"},
    "Thailand": {"phone_length": "9"},
    "Turkey": {"phone_length": "10"},
    "Ukraine": {"phone_length": "9"},
    "United Arab Emirates": {"phone_length": "9"},
    "United Kingdom": {"phone_length": "9-10"},
    "United States": {"phone_length": "10"},
    "Vietnam": {"phone_length": "8"},
    "Yemen": {"phone_length": "9"}
  };

  final countryphone = countryInfoJson[countryName]?["phone_length"];

  if (countryphone != null) {
    return int.parse(countryphone);
  }

  return null;
}

String? getCountryFlag(String? countryName) {
  if (countryName == null) {
    return null;
  }
  final countryInfoJson = {
    "Afghanistan": {"dial_code": "+93", "code": "AF"},
    "Aland Islands": {"dial_code": "+358", "code": "AX"},
    "Albania": {"dial_code": "+355", "code": "AL"},
    "Algeria": {"dial_code": "+213", "code": "DZ"},
    "AmericanSamoa": {"dial_code": "+1684", "code": "AS"},
    "Andorra": {"dial_code": "+376", "code": "AD"},
    "Angola": {"dial_code": "+244", "code": "AO"},
    "Anguilla": {"dial_code": "+1264", "code": "AI"},
    "Antarctica": {"dial_code": "+672", "code": "AQ"},
    "Antigua and Barbuda": {"dial_code": "+1268", "code": "AG"},
    "Argentina": {"dial_code": "+54", "code": "AR"},
    "Armenia": {"dial_code": "+374", "code": "AM"},
    "Aruba": {"dial_code": "+297", "code": "AW"},
    "Australia": {"dial_code": "+61", "code": "AU"},
    "Austria": {"dial_code": "+43", "code": "AT"},
    "Azerbaijan": {"dial_code": "+994", "code": "AZ"},
    "Bahamas": {"dial_code": "+1242", "code": "BS"},
    "Bahrain": {"dial_code": "+973", "code": "BH"},
    "Bangladesh": {"dial_code": "+880", "code": "BD"},
    "Barbados": {"dial_code": "+1246", "code": "BB"},
    "Belarus": {"dial_code": "+375", "code": "BY"},
    "Belgium": {"dial_code": "+32", "code": "BE"},
    "Belize": {"dial_code": "+501", "code": "BZ"},
    "Benin": {"dial_code": "+229", "code": "BJ"},
    "Bermuda": {"dial_code": "+1441", "code": "BM"},
    "Bhutan": {"dial_code": "+975", "code": "BT"},
    "Bolivia, Plurinational State of": {"dial_code": "+591", "code": "BO"},
    "Bosnia and Herzegovina": {"dial_code": "+387", "code": "BA"},
    "Botswana": {"dial_code": "+267", "code": "BW"},
    "Brazil": {"dial_code": "+55", "code": "BR"},
    "British Indian Ocean Territory": {"dial_code": "+246", "code": "IO"},
    "Brunei Darussalam": {"dial_code": "+673", "code": "BN"},
    "Bulgaria": {"dial_code": "+359", "code": "BG"},
    "Burkina Faso": {"dial_code": "+226", "code": "BF"},
    "Burundi": {"dial_code": "+257", "code": "BI"},
    "Cambodia": {"dial_code": "+855", "code": "KH"},
    "Cameroon": {"dial_code": "+237", "code": "CM"},
    "Canada": {"dial_code": "+1", "code": "CA"},
    "Cape Verde": {"dial_code": "+238", "code": "CV"},
    "Cayman Islands": {"dial_code": "+ 345", "code": "KY"},
    "Central African Republic": {"dial_code": "+236", "code": "CF"},
    "Chad": {"dial_code": "+235", "code": "TD"},
    "Chile": {"dial_code": "+56", "code": "CL"},
    "China": {"dial_code": "+86", "code": "CN"},
    "Christmas Island": {"dial_code": "+61", "code": "CX"},
    "Cocos (Keeling) Islands": {"dial_code": "+61", "code": "CC"},
    "Colombia": {"dial_code": "+57", "code": "CO"},
    "Comoros": {"dial_code": "+269", "code": "KM"},
    "Congo": {"dial_code": "+242", "code": "CG"},
    "Congo, The Democratic Republic of the Congo": {
      "dial_code": "+243",
      "code": "CD"
    },
    "Cook Islands": {"dial_code": "+682", "code": "CK"},
    "Costa Rica": {"dial_code": "+506", "code": "CR"},
    "Cote d'Ivoire": {"dial_code": "+225", "code": "CI"},
    "Croatia": {"dial_code": "+385", "code": "HR"},
    "Cuba": {"dial_code": "+53", "code": "CU"},
    "Cyprus": {"dial_code": "+357", "code": "CY"},
    "Czech Republic": {"dial_code": "+420", "code": "CZ"},
    "Denmark": {"dial_code": "+45", "code": "DK"},
    "Djibouti": {"dial_code": "+253", "code": "DJ"},
    "Dominica": {"dial_code": "+1767", "code": "DM"},
    "Dominican Republic": {"dial_code": "+1849", "code": "DO"},
    "Ecuador": {"dial_code": "+593", "code": "EC"},
    "Egypt": {"dial_code": "+20", "code": "EG"},
    "El Salvador": {"dial_code": "+503", "code": "SV"},
    "Equatorial Guinea": {"dial_code": "+240", "code": "GQ"},
    "Eritrea": {"dial_code": "+291", "code": "ER"},
    "Estonia": {"dial_code": "+372", "code": "EE"},
    "Ethiopia": {"dial_code": "+251", "code": "ET"},
    "Falkland Islands (Malvinas)": {"dial_code": "+500", "code": "FK"},
    "Faroe Islands": {"dial_code": "+298", "code": "FO"},
    "Fiji": {"dial_code": "+679", "code": "FJ"},
    "Finland": {"dial_code": "+358", "code": "FI"},
    "France": {"dial_code": "+33", "code": "FR"},
    "French Guiana": {"dial_code": "+594", "code": "GF"},
    "French Polynesia": {"dial_code": "+689", "code": "PF"},
    "Gabon": {"dial_code": "+241", "code": "GA"},
    "Gambia": {"dial_code": "+220", "code": "GM"},
    "Georgia": {"dial_code": "+995", "code": "GE"},
    "Germany": {"dial_code": "+49", "code": "DE"},
    "Ghana": {"dial_code": "+233", "code": "GH"},
    "Gibraltar": {"dial_code": "+350", "code": "GI"},
    "Greece": {"dial_code": "+30", "code": "GR"},
    "Greenland": {"dial_code": "+299", "code": "GL"},
    "Grenada": {"dial_code": "+1473", "code": "GD"},
    "Guadeloupe": {"dial_code": "+590", "code": "GP"},
    "Guam": {"dial_code": "+1671", "code": "GU"},
    "Guatemala": {"dial_code": "+502", "code": "GT"},
    "Guernsey": {"dial_code": "+44", "code": "GG"},
    "Guinea": {"dial_code": "+224", "code": "GN"},
    "Guinea-Bissau": {"dial_code": "+245", "code": "GW"},
    "Guyana": {"dial_code": "+595", "code": "GY"},
    "Haiti": {"dial_code": "+509", "code": "HT"},
    "Holy See (Vatican City State)": {"dial_code": "+379", "code": "VA"},
    "Honduras": {"dial_code": "+504", "code": "HN"},
    "Hong Kong": {"dial_code": "+852", "code": "HK"},
    "Hungary": {"dial_code": "+36", "code": "HU"},
    "Iceland": {"dial_code": "+354", "code": "IS"},
    "India": {"dial_code": "+91", "code": "IN"},
    "Indonesia": {"dial_code": "+62", "code": "ID"},
    "Iran, Islamic Republic of Persian Gulf": {
      "dial_code": "+98",
      "code": "IR"
    },
    "Iraq": {"dial_code": "+964", "code": "IQ"},
    "Ireland": {"dial_code": "+353", "code": "IE"},
    "Isle of Man": {"dial_code": "+44", "code": "IM"},
    "Israel": {"dial_code": "+972", "code": "IL"},
    "Italy": {"dial_code": "+39", "code": "IT"},
    "Jamaica": {"dial_code": "+1876", "code": "JM"},
    "Japan": {"dial_code": "+81", "code": "JP"},
    "Jersey": {"dial_code": "+44", "code": "JE"},
    "Jordan": {"dial_code": "+962", "code": "JO"},
    "Kazakhstan": {"dial_code": "+77", "code": "KZ"},
    "Kenya": {"dial_code": "+254", "code": "KE"},
    "Kiribati": {"dial_code": "+686", "code": "KI"},
    "Korea, Democratic People's Republic of Korea": {
      "dial_code": "+850",
      "code": "KP"
    },
    "Korea, Republic of South Korea": {"dial_code": "+82", "code": "KR"},
    "Kuwait": {"dial_code": "+965", "code": "KW"},
    "Kyrgyzstan": {"dial_code": "+996", "code": "KG"},
    "Laos": {"dial_code": "+856", "code": "LA"},
    "Latvia": {"dial_code": "+371", "code": "LV"},
    "Lebanon": {"dial_code": "+961", "code": "LB"},
    "Lesotho": {"dial_code": "+266", "code": "LS"},
    "Liberia": {"dial_code": "+231", "code": "LR"},
    "Libyan Arab Jamahiriya": {"dial_code": "+218", "code": "LY"},
    "Liechtenstein": {"dial_code": "+423", "code": "LI"},
    "Lithuania": {"dial_code": "+370", "code": "LT"},
    "Luxembourg": {"dial_code": "+352", "code": "LU"},
    "Macao": {"dial_code": "+853", "code": "MO"},
    "Macedonia": {"dial_code": "+389", "code": "MK"},
    "Madagascar": {"dial_code": "+261", "code": "MG"},
    "Malawi": {"dial_code": "+265", "code": "MW"},
    "Malaysia": {"dial_code": "+60", "code": "MY"},
    "Maldives": {"dial_code": "+960", "code": "MV"},
    "Mali": {"dial_code": "+223", "code": "ML"},
    "Malta": {"dial_code": "+356", "code": "MT"},
    "Marshall Islands": {"dial_code": "+692", "code": "MH"},
    "Martinique": {"dial_code": "+596", "code": "MQ"},
    "Mauritania": {"dial_code": "+222", "code": "MR"},
    "Mauritius": {"dial_code": "+230", "code": "MU"},
    "Mayotte": {"dial_code": "+262", "code": "YT"},
    "Mexico": {"dial_code": "+52", "code": "MX"},
    "Micronesia, Federated States of Micronesia": {
      "dial_code": "+691",
      "code": "FM"
    },
    "Moldova": {"dial_code": "+373", "code": "MD"},
    "Monaco": {"dial_code": "+377", "code": "MC"},
    "Mongolia": {"dial_code": "+976", "code": "MN"},
    "Montenegro": {"dial_code": "+382", "code": "ME"},
    "Montserrat": {"dial_code": "+1664", "code": "MS"},
    "Morocco": {"dial_code": "+212", "code": "MA"},
    "Mozambique": {"dial_code": "+258", "code": "MZ"},
    "Myanmar": {"dial_code": "+95", "code": "MM"},
    "Namibia": {"dial_code": "+264", "code": "NA"},
    "Nauru": {"dial_code": "+674", "code": "NR"},
    "Nepal": {"dial_code": "+977", "code": "NP"},
    "Netherlands": {"dial_code": "+31", "code": "NL"},
    "Netherlands Antilles": {"dial_code": "+599", "code": "AN"},
    "New Caledonia": {"dial_code": "+687", "code": "NC"},
    "New Zealand": {"dial_code": "+64", "code": "NZ"},
    "Nicaragua": {"dial_code": "+505", "code": "NI"},
    "Niger": {"dial_code": "+227", "code": "NE"},
    "Nigeria": {"dial_code": "+234", "code": "NG"},
    "Niue": {"dial_code": "+683", "code": "NU"},
    "Norfolk Island": {"dial_code": "+672", "code": "NF"},
    "Northern Mariana Islands": {"dial_code": "+1670", "code": "MP"},
    "Norway": {"dial_code": "+47", "code": "NO"},
    "Oman": {"dial_code": "+968", "code": "OM"},
    "Pakistan": {"dial_code": "+92", "code": "PK"},
    "Palau": {"dial_code": "+680", "code": "PW"},
    "Palestinian Territory, Occupied": {"dial_code": "+970", "code": "PS"},
    "Panama": {"dial_code": "+507", "code": "PA"},
    "Papua New Guinea": {"dial_code": "+675", "code": "PG"},
    "Paraguay": {"dial_code": "+595", "code": "PY"},
    "Peru": {"dial_code": "+51", "code": "PE"},
    "Philippines": {"dial_code": "+63", "code": "PH"},
    "Pitcairn": {"dial_code": "+872", "code": "PN"},
    "Poland": {"dial_code": "+48", "code": "PL"},
    "Portugal": {"dial_code": "+351", "code": "PT"},
    "Puerto Rico": {"dial_code": "+1939", "code": "PR"},
    "Qatar": {"dial_code": "+974", "code": "QA"},
    "Romania": {"dial_code": "+40", "code": "RO"},
    "Russia": {"dial_code": "+7", "code": "RU"},
    "Rwanda": {"dial_code": "+250", "code": "RW"},
    "Reunion": {"dial_code": "+262", "code": "RE"},
    "Saint Barthelemy": {"dial_code": "+590", "code": "BL"},
    "Saint Helena, Ascension and Tristan Da Cunha": {
      "dial_code": "+290",
      "code": "SH"
    },
    "Saint Kitts and Nevis": {"dial_code": "+1869", "code": "KN"},
    "Saint Lucia": {"dial_code": "+1758", "code": "LC"},
    "Saint Martin": {"dial_code": "+590", "code": "MF"},
    "Saint Pierre and Miquelon": {"dial_code": "+508", "code": "PM"},
    "Saint Vincent and the Grenadines": {"dial_code": "+1784", "code": "VC"},
    "Samoa": {"dial_code": "+685", "code": "WS"},
    "San Marino": {"dial_code": "+378", "code": "SM"},
    "Sao Tome and Principe": {"dial_code": "+239", "code": "ST"},
    "Saudi Arabia": {"dial_code": "+966", "code": "SA"},
    "Senegal": {"dial_code": "+221", "code": "SN"},
    "Serbia": {"dial_code": "+381", "code": "RS"},
    "Seychelles": {"dial_code": "+248", "code": "SC"},
    "Sierra Leone": {"dial_code": "+232", "code": "SL"},
    "Singapore": {"dial_code": "+65", "code": "SG"},
    "Slovakia": {"dial_code": "+421", "code": "SK"},
    "Slovenia": {"dial_code": "+386", "code": "SI"},
    "Solomon Islands": {"dial_code": "+677", "code": "SB"},
    "Somalia": {"dial_code": "+252", "code": "SO"},
    "South Africa": {"dial_code": "+27", "code": "ZA"},
    "South Sudan": {"dial_code": "+211", "code": "SS"},
    "South Georgia and the South Sandwich Islands": {
      "dial_code": "+500",
      "code": "GS"
    },
    "Spain": {"dial_code": "+34", "code": "ES"},
    "Sri Lanka": {"dial_code": "+94", "code": "LK"},
    "Sudan": {"dial_code": "+249", "code": "SD"},
    "Suriname": {"dial_code": "+597", "code": "SR"},
    "Svalbard and Jan Mayen": {"dial_code": "+47", "code": "SJ"},
    "Swaziland": {"dial_code": "+268", "code": "SZ"},
    "Sweden": {"dial_code": "+46", "code": "SE"},
    "Switzerland": {"dial_code": "+41", "code": "CH"},
    "Syrian Arab Republic": {"dial_code": "+963", "code": "SY"},
    "Taiwan": {"dial_code": "+886", "code": "TW"},
    "Tajikistan": {"dial_code": "+992", "code": "TJ"},
    "Tanzania, United Republic of Tanzania": {
      "dial_code": "+255",
      "code": "TZ"
    },
    "Thailand": {"dial_code": "+66", "code": "TH"},
    "Timor-Leste": {"dial_code": "+670", "code": "TL"},
    "Togo": {"dial_code": "+228", "code": "TG"},
    "Tokelau": {"dial_code": "+690", "code": "TK"},
    "Tonga": {"dial_code": "+676", "code": "TO"},
    "Trinidad and Tobago": {"dial_code": "+1868", "code": "TT"},
    "Tunisia": {"dial_code": "+216", "code": "TN"},
    "Turkey": {"dial_code": "+90", "code": "TR"},
    "Turkmenistan": {"dial_code": "+993", "code": "TM"},
    "Turks and Caicos Islands": {"dial_code": "+1649", "code": "TC"},
    "Tuvalu": {"dial_code": "+688", "code": "TV"},
    "Uganda": {"dial_code": "+256", "code": "UG"},
    "Ukraine": {"dial_code": "+380", "code": "UA"},
    "United Arab Emirates": {"dial_code": "+971", "code": "AE"},
    "United Kingdom": {"dial_code": "+44", "code": "GB"},
    "United States": {"dial_code": "+1", "code": "US"},
    "Uruguay": {"dial_code": "+598", "code": "UY"},
    "Uzbekistan": {"dial_code": "+998", "code": "UZ"},
    "Vanuatu": {"dial_code": "+678", "code": "VU"},
    "Venezuela, Bolivarian Republic of Venezuela": {
      "dial_code": "+58",
      "code": "VE"
    },
    "Vietnam": {"dial_code": "+84", "code": "VN"},
    "Virgin Islands, British": {"dial_code": "+1284", "code": "VG"},
    "Virgin Islands, U.S.": {"dial_code": "+1340", "code": "VI"},
    "Wallis and Futuna": {"dial_code": "+681", "code": "WF"},
    "Yemen": {"dial_code": "+967", "code": "YE"},
    "Zambia": {"dial_code": "+260", "code": "ZM"},
    "Zimbabwe": {"dial_code": "+263", "code": "ZW"}
  };

  final countryCode = countryInfoJson[countryName]?["code"];

  if (countryCode != null) {
    final countryCodeInLowerCase = countryCode.toLowerCase();
    return 'https://flagcdn.com/h80/$countryCodeInLowerCase.png';
  }

  return null;
}

double newCartTotal(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }
  return (double.parse(total.toStringAsFixed(2)));
}

List<String> getCountrListGCC() {
  final countries = [
    "Bahrain",
    "Kuwait",
    "Oman",
    "Qatar",
    "Saudi Arabia",
    "United Arab Emirates",
    "India",
  ];

  return countries;
}

int? calculateAge(DateTime dob) {
  DateTime now = DateTime.now();
  int years = now.year - dob.year;
  int months = now.month - dob.month;
  int days = now.day - dob.day;

  if (days < 0 || (months <= 0 && days <= 0)) {
    years--;
    if (months <= 0) {
      months += 12;
    }
    if (days <= 0) {
      // Calculate the number of days in the previous month
      int daysInPreviousMonth =
          DateTime(now.year, now.month - 1, 1).add(Duration(days: -1)).day;
      days += daysInPreviousMonth;
    }
  }

  return years;
}

DateTime getDateForSubscription(
  DateTime startDate,
  int numberDay,
) {
  DateTime dt1 = startDate;
  DateTime dt5 = dt1.add(Duration(days: numberDay));
  return (dt5);
}

DateTime subtractDaysFromDateTime(
  DateTime currentDateTime,
  int daysToSubtract,
) {
  return currentDateTime.subtract(Duration(days: daysToSubtract));
}

String? getDialCodeWithPlus(String? countryName) {
  if (countryName == null) {
    return null;
  }
  final countryInfoJson = {
    "Afghanistan": {"dial_code": "+93", "code": "AF"},
    "Aland Islands": {"dial_code": "+358", "code": "AX"},
    "Albania": {"dial_code": "+355", "code": "AL"},
    "Algeria": {"dial_code": "+213", "code": "DZ"},
    "AmericanSamoa": {"dial_code": "+1684", "code": "AS"},
    "Andorra": {"dial_code": "+376", "code": "AD"},
    "Angola": {"dial_code": "+244", "code": "AO"},
    "Anguilla": {"dial_code": "+1264", "code": "AI"},
    "Antarctica": {"dial_code": "+672", "code": "AQ"},
    "Antigua and Barbuda": {"dial_code": "+1268", "code": "AG"},
    "Argentina": {"dial_code": "+54", "code": "AR"},
    "Armenia": {"dial_code": "+374", "code": "AM"},
    "Aruba": {"dial_code": "+297", "code": "AW"},
    "Australia": {"dial_code": "+61", "code": "AU"},
    "Austria": {"dial_code": "+43", "code": "AT"},
    "Azerbaijan": {"dial_code": "+994", "code": "AZ"},
    "Bahamas": {"dial_code": "+1242", "code": "BS"},
    "Bahrain": {"dial_code": "+973", "code": "BH"},
    "Bangladesh": {"dial_code": "+880", "code": "BD"},
    "Barbados": {"dial_code": "+1246", "code": "BB"},
    "Belarus": {"dial_code": "+375", "code": "BY"},
    "Belgium": {"dial_code": "+32", "code": "BE"},
    "Belize": {"dial_code": "+501", "code": "BZ"},
    "Benin": {"dial_code": "+229", "code": "BJ"},
    "Bermuda": {"dial_code": "+1441", "code": "BM"},
    "Bhutan": {"dial_code": "+975", "code": "BT"},
    "Bolivia, Plurinational State of": {"dial_code": "+591", "code": "BO"},
    "Bosnia and Herzegovina": {"dial_code": "+387", "code": "BA"},
    "Botswana": {"dial_code": "+267", "code": "BW"},
    "Brazil": {"dial_code": "+55", "code": "BR"},
    "British Indian Ocean Territory": {"dial_code": "+246", "code": "IO"},
    "Brunei Darussalam": {"dial_code": "+673", "code": "BN"},
    "Bulgaria": {"dial_code": "+359", "code": "BG"},
    "Burkina Faso": {"dial_code": "+226", "code": "BF"},
    "Burundi": {"dial_code": "+257", "code": "BI"},
    "Cambodia": {"dial_code": "+855", "code": "KH"},
    "Cameroon": {"dial_code": "+237", "code": "CM"},
    "Canada": {"dial_code": "+1", "code": "CA"},
    "Cape Verde": {"dial_code": "+238", "code": "CV"},
    "Cayman Islands": {"dial_code": "+ 345", "code": "KY"},
    "Central African Republic": {"dial_code": "+236", "code": "CF"},
    "Chad": {"dial_code": "+235", "code": "TD"},
    "Chile": {"dial_code": "+56", "code": "CL"},
    "China": {"dial_code": "+86", "code": "CN"},
    "Christmas Island": {"dial_code": "+61", "code": "CX"},
    "Cocos (Keeling) Islands": {"dial_code": "+61", "code": "CC"},
    "Colombia": {"dial_code": "+57", "code": "CO"},
    "Comoros": {"dial_code": "+269", "code": "KM"},
    "Congo": {"dial_code": "+242", "code": "CG"},
    "Congo, The Democratic Republic of the Congo": {
      "dial_code": "+243",
      "code": "CD"
    },
    "Cook Islands": {"dial_code": "+682", "code": "CK"},
    "Costa Rica": {"dial_code": "+506", "code": "CR"},
    "Cote d'Ivoire": {"dial_code": "+225", "code": "CI"},
    "Croatia": {"dial_code": "+385", "code": "HR"},
    "Cuba": {"dial_code": "+53", "code": "CU"},
    "Cyprus": {"dial_code": "+357", "code": "CY"},
    "Czech Republic": {"dial_code": "+420", "code": "CZ"},
    "Denmark": {"dial_code": "+45", "code": "DK"},
    "Djibouti": {"dial_code": "+253", "code": "DJ"},
    "Dominica": {"dial_code": "+1767", "code": "DM"},
    "Dominican Republic": {"dial_code": "+1849", "code": "DO"},
    "Ecuador": {"dial_code": "+593", "code": "EC"},
    "Egypt": {"dial_code": "+20", "code": "EG"},
    "El Salvador": {"dial_code": "+503", "code": "SV"},
    "Equatorial Guinea": {"dial_code": "+240", "code": "GQ"},
    "Eritrea": {"dial_code": "+291", "code": "ER"},
    "Estonia": {"dial_code": "+372", "code": "EE"},
    "Ethiopia": {"dial_code": "+251", "code": "ET"},
    "Falkland Islands (Malvinas)": {"dial_code": "+500", "code": "FK"},
    "Faroe Islands": {"dial_code": "+298", "code": "FO"},
    "Fiji": {"dial_code": "+679", "code": "FJ"},
    "Finland": {"dial_code": "+358", "code": "FI"},
    "France": {"dial_code": "+33", "code": "FR"},
    "French Guiana": {"dial_code": "+594", "code": "GF"},
    "French Polynesia": {"dial_code": "+689", "code": "PF"},
    "Gabon": {"dial_code": "+241", "code": "GA"},
    "Gambia": {"dial_code": "+220", "code": "GM"},
    "Georgia": {"dial_code": "+995", "code": "GE"},
    "Germany": {"dial_code": "+49", "code": "DE"},
    "Ghana": {"dial_code": "+233", "code": "GH"},
    "Gibraltar": {"dial_code": "+350", "code": "GI"},
    "Greece": {"dial_code": "+30", "code": "GR"},
    "Greenland": {"dial_code": "+299", "code": "GL"},
    "Grenada": {"dial_code": "+1473", "code": "GD"},
    "Guadeloupe": {"dial_code": "+590", "code": "GP"},
    "Guam": {"dial_code": "+1671", "code": "GU"},
    "Guatemala": {"dial_code": "+502", "code": "GT"},
    "Guernsey": {"dial_code": "+44", "code": "GG"},
    "Guinea": {"dial_code": "+224", "code": "GN"},
    "Guinea-Bissau": {"dial_code": "+245", "code": "GW"},
    "Guyana": {"dial_code": "+595", "code": "GY"},
    "Haiti": {"dial_code": "+509", "code": "HT"},
    "Holy See (Vatican City State)": {"dial_code": "+379", "code": "VA"},
    "Honduras": {"dial_code": "+504", "code": "HN"},
    "Hong Kong": {"dial_code": "+852", "code": "HK"},
    "Hungary": {"dial_code": "+36", "code": "HU"},
    "Iceland": {"dial_code": "+354", "code": "IS"},
    "India": {"dial_code": "+91", "code": "IN"},
    "Indonesia": {"dial_code": "+62", "code": "ID"},
    "Iran, Islamic Republic of Persian Gulf": {
      "dial_code": "+98",
      "code": "IR"
    },
    "Iraq": {"dial_code": "+964", "code": "IQ"},
    "Ireland": {"dial_code": "+353", "code": "IE"},
    "Isle of Man": {"dial_code": "+44", "code": "IM"},
    "Israel": {"dial_code": "+972", "code": "IL"},
    "Italy": {"dial_code": "+39", "code": "IT"},
    "Jamaica": {"dial_code": "+1876", "code": "JM"},
    "Japan": {"dial_code": "+81", "code": "JP"},
    "Jersey": {"dial_code": "+44", "code": "JE"},
    "Jordan": {"dial_code": "+962", "code": "JO"},
    "Kazakhstan": {"dial_code": "+77", "code": "KZ"},
    "Kenya": {"dial_code": "+254", "code": "KE"},
    "Kiribati": {"dial_code": "+686", "code": "KI"},
    "Korea, Democratic People's Republic of Korea": {
      "dial_code": "+850",
      "code": "KP"
    },
    "Korea, Republic of South Korea": {"dial_code": "+82", "code": "KR"},
    "Kuwait": {"dial_code": "+965", "code": "KW"},
    "Kyrgyzstan": {"dial_code": "+996", "code": "KG"},
    "Laos": {"dial_code": "+856", "code": "LA"},
    "Latvia": {"dial_code": "+371", "code": "LV"},
    "Lebanon": {"dial_code": "+961", "code": "LB"},
    "Lesotho": {"dial_code": "+266", "code": "LS"},
    "Liberia": {"dial_code": "+231", "code": "LR"},
    "Libyan Arab Jamahiriya": {"dial_code": "+218", "code": "LY"},
    "Liechtenstein": {"dial_code": "+423", "code": "LI"},
    "Lithuania": {"dial_code": "+370", "code": "LT"},
    "Luxembourg": {"dial_code": "+352", "code": "LU"},
    "Macao": {"dial_code": "+853", "code": "MO"},
    "Macedonia": {"dial_code": "+389", "code": "MK"},
    "Madagascar": {"dial_code": "+261", "code": "MG"},
    "Malawi": {"dial_code": "+265", "code": "MW"},
    "Malaysia": {"dial_code": "+60", "code": "MY"},
    "Maldives": {"dial_code": "+960", "code": "MV"},
    "Mali": {"dial_code": "+223", "code": "ML"},
    "Malta": {"dial_code": "+356", "code": "MT"},
    "Marshall Islands": {"dial_code": "+692", "code": "MH"},
    "Martinique": {"dial_code": "+596", "code": "MQ"},
    "Mauritania": {"dial_code": "+222", "code": "MR"},
    "Mauritius": {"dial_code": "+230", "code": "MU"},
    "Mayotte": {"dial_code": "+262", "code": "YT"},
    "Mexico": {"dial_code": "+52", "code": "MX"},
    "Micronesia, Federated States of Micronesia": {
      "dial_code": "+691",
      "code": "FM"
    },
    "Moldova": {"dial_code": "+373", "code": "MD"},
    "Monaco": {"dial_code": "+377", "code": "MC"},
    "Mongolia": {"dial_code": "+976", "code": "MN"},
    "Montenegro": {"dial_code": "+382", "code": "ME"},
    "Montserrat": {"dial_code": "+1664", "code": "MS"},
    "Morocco": {"dial_code": "+212", "code": "MA"},
    "Mozambique": {"dial_code": "+258", "code": "MZ"},
    "Myanmar": {"dial_code": "+95", "code": "MM"},
    "Namibia": {"dial_code": "+264", "code": "NA"},
    "Nauru": {"dial_code": "+674", "code": "NR"},
    "Nepal": {"dial_code": "+977", "code": "NP"},
    "Netherlands": {"dial_code": "+31", "code": "NL"},
    "Netherlands Antilles": {"dial_code": "+599", "code": "AN"},
    "New Caledonia": {"dial_code": "+687", "code": "NC"},
    "New Zealand": {"dial_code": "+64", "code": "NZ"},
    "Nicaragua": {"dial_code": "+505", "code": "NI"},
    "Niger": {"dial_code": "+227", "code": "NE"},
    "Nigeria": {"dial_code": "+234", "code": "NG"},
    "Niue": {"dial_code": "+683", "code": "NU"},
    "Norfolk Island": {"dial_code": "+672", "code": "NF"},
    "Northern Mariana Islands": {"dial_code": "+1670", "code": "MP"},
    "Norway": {"dial_code": "+47", "code": "NO"},
    "Oman": {"dial_code": "+968", "code": "OM"},
    "Pakistan": {"dial_code": "+92", "code": "PK"},
    "Palau": {"dial_code": "+680", "code": "PW"},
    "Palestinian Territory, Occupied": {"dial_code": "+970", "code": "PS"},
    "Panama": {"dial_code": "+507", "code": "PA"},
    "Papua New Guinea": {"dial_code": "+675", "code": "PG"},
    "Paraguay": {"dial_code": "+595", "code": "PY"},
    "Peru": {"dial_code": "+51", "code": "PE"},
    "Philippines": {"dial_code": "+63", "code": "PH"},
    "Pitcairn": {"dial_code": "+872", "code": "PN"},
    "Poland": {"dial_code": "+48", "code": "PL"},
    "Portugal": {"dial_code": "+351", "code": "PT"},
    "Puerto Rico": {"dial_code": "+1939", "code": "PR"},
    "Qatar": {"dial_code": "+974", "code": "QA"},
    "Romania": {"dial_code": "+40", "code": "RO"},
    "Russia": {"dial_code": "+7", "code": "RU"},
    "Rwanda": {"dial_code": "+250", "code": "RW"},
    "Reunion": {"dial_code": "+262", "code": "RE"},
    "Saint Barthelemy": {"dial_code": "+590", "code": "BL"},
    "Saint Helena, Ascension and Tristan Da Cunha": {
      "dial_code": "+290",
      "code": "SH"
    },
    "Saint Kitts and Nevis": {"dial_code": "+1869", "code": "KN"},
    "Saint Lucia": {"dial_code": "+1758", "code": "LC"},
    "Saint Martin": {"dial_code": "+590", "code": "MF"},
    "Saint Pierre and Miquelon": {"dial_code": "+508", "code": "PM"},
    "Saint Vincent and the Grenadines": {"dial_code": "+1784", "code": "VC"},
    "Samoa": {"dial_code": "+685", "code": "WS"},
    "San Marino": {"dial_code": "+378", "code": "SM"},
    "Sao Tome and Principe": {"dial_code": "+239", "code": "ST"},
    "Saudi Arabia": {"dial_code": "+966", "code": "SA"},
    "Senegal": {"dial_code": "+221", "code": "SN"},
    "Serbia": {"dial_code": "+381", "code": "RS"},
    "Seychelles": {"dial_code": "+248", "code": "SC"},
    "Sierra Leone": {"dial_code": "+232", "code": "SL"},
    "Singapore": {"dial_code": "+65", "code": "SG"},
    "Slovakia": {"dial_code": "+421", "code": "SK"},
    "Slovenia": {"dial_code": "+386", "code": "SI"},
    "Solomon Islands": {"dial_code": "+677", "code": "SB"},
    "Somalia": {"dial_code": "+252", "code": "SO"},
    "South Africa": {"dial_code": "+27", "code": "ZA"},
    "South Sudan": {"dial_code": "+211", "code": "SS"},
    "South Georgia and the South Sandwich Islands": {
      "dial_code": "+500",
      "code": "GS"
    },
    "Spain": {"dial_code": "+34", "code": "ES"},
    "Sri Lanka": {"dial_code": "+94", "code": "LK"},
    "Sudan": {"dial_code": "+249", "code": "SD"},
    "Suriname": {"dial_code": "+597", "code": "SR"},
    "Svalbard and Jan Mayen": {"dial_code": "+47", "code": "SJ"},
    "Swaziland": {"dial_code": "+268", "code": "SZ"},
    "Sweden": {"dial_code": "+46", "code": "SE"},
    "Switzerland": {"dial_code": "+41", "code": "CH"},
    "Syrian Arab Republic": {"dial_code": "+963", "code": "SY"},
    "Taiwan": {"dial_code": "+886", "code": "TW"},
    "Tajikistan": {"dial_code": "+992", "code": "TJ"},
    "Tanzania, United Republic of Tanzania": {
      "dial_code": "+255",
      "code": "TZ"
    },
    "Thailand": {"dial_code": "+66", "code": "TH"},
    "Timor-Leste": {"dial_code": "+670", "code": "TL"},
    "Togo": {"dial_code": "+228", "code": "TG"},
    "Tokelau": {"dial_code": "+690", "code": "TK"},
    "Tonga": {"dial_code": "+676", "code": "TO"},
    "Trinidad and Tobago": {"dial_code": "+1868", "code": "TT"},
    "Tunisia": {"dial_code": "+216", "code": "TN"},
    "Turkey": {"dial_code": "+90", "code": "TR"},
    "Turkmenistan": {"dial_code": "+993", "code": "TM"},
    "Turks and Caicos Islands": {"dial_code": "+1649", "code": "TC"},
    "Tuvalu": {"dial_code": "+688", "code": "TV"},
    "Uganda": {"dial_code": "+256", "code": "UG"},
    "Ukraine": {"dial_code": "+380", "code": "UA"},
    "United Arab Emirates": {"dial_code": "+971", "code": "AE"},
    "United Kingdom": {"dial_code": "+44", "code": "GB"},
    "United States": {"dial_code": "+1", "code": "US"},
    "Uruguay": {"dial_code": "+598", "code": "UY"},
    "Uzbekistan": {"dial_code": "+998", "code": "UZ"},
    "Vanuatu": {"dial_code": "+678", "code": "VU"},
    "Venezuela, Bolivarian Republic of Venezuela": {
      "dial_code": "+58",
      "code": "VE"
    },
    "Vietnam": {"dial_code": "+84", "code": "VN"},
    "Virgin Islands, British": {"dial_code": "+1284", "code": "VG"},
    "Virgin Islands, U.S.": {"dial_code": "+1340", "code": "VI"},
    "Wallis and Futuna": {"dial_code": "+681", "code": "WF"},
    "Yemen": {"dial_code": "+967", "code": "YE"},
    "Zambia": {"dial_code": "+260", "code": "ZM"},
    "Zimbabwe": {"dial_code": "+263", "code": "ZW"}
  };

  final countryDialCode = countryInfoJson[countryName]?["dial_code"];

  if (countryDialCode != null) {
    return countryDialCode;
  }

  return null;
}

String getTimeOfDay() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour >= 5 && hour < 12) {
    return 'Morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Afternoon';
  } else if (hour >= 17 && hour < 21) {
    return 'Evening';
  } else {
    return 'hide'; // Or you can combine night with morning if needed.
  }
}

String imageUploadfilepond(String? uid) {
  return '''
       <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Upload</title>
    <link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
    <script src="https://unpkg.com/filepond/dist/filepond.js"></script>
    <script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
    <script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
    <style>
        .filepond--root {
            max-width: 100%;
            margin: auto;
            position: relative;
        }

        .filepond--list {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .filepond--item {
            flex: 1 1 calc(25% - 1rem); /* 4 items per row */
            max-width: calc(25% - 1rem);
            box-sizing: border-box;
            min-width: 150px; /* Adjust to fit your needs */
        }

        .filepond--item-panel {
            max-width: none;
            width: auto;
        }

        .advanced-settings {
            display: none;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
            gap: 1rem;
            margin-top: 1em;
        }

        .toggle-label {
            margin-right: 0.5em;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 30px; /* Half the original size */
            height: 17px; /* Half the original size */
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 17px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 13px; /* Adjusted for the smaller switch */
            width: 13px; /* Adjusted for the smaller switch */
            left: 2px;
            bottom: 2px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #4CAF50; /* Green color for the checked state */
        }

        input:checked + .slider:before {
            transform: translateX(13px); /* Adjusted for the smaller switch */
        }

        .advanced-settings-toggle {
            text-align: right;
            margin-top: 10px;
            cursor: pointer;
            color: #4CAF50; /* Green color for the settings text */
        }
    </style>
</head>
<body>
    <form action="https://proxy.vizsoft.in/https://vizsoft.in/imageAzyaa/upload.php?uid=$uid" class="filepond" id="filepond">
        <div class="fallback">
          <input name="file" type="file" multiple />
        </div>
       
      </div>
      </form>
    <div class="advanced-settings-toggle">Settings</div>
    <div class="advanced-settings">
        <div class="toggle-container">
            <label class="toggle-label" for="auto-clear">Clear uploads</label>
            <label class="switch">
                <input type="checkbox" id="auto-clear">
                <span class="slider"></span>
            </label>
        </div>
        <div class="toggle-container">
            <label class="toggle-label" for="auto-upload">Auto upload</label>
            <label class="switch">
                <input type="checkbox" id="auto-upload" checked>
                <span class="slider"></span>
            </label>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Register plugins
            FilePond.registerPlugin(
                FilePondPluginFileValidateSize,
                FilePondPluginFileValidateType,
            );

            // Define values for project and endpoint
            const project = "Azyaa";
            const endpoint = 'https://proxy.vizsoft.in/https://vizsoft.in/imageAzyaa/upload.php?uid=$uid';

            // Create a FilePond instance
            const pond = FilePond.create(document.querySelector('#filepond'), {
                allowMultiple: true,
                allowPaste: false,
                maxFileSize: "500MB",
                acceptedFileTypes: ['image/*'],
                credits: false,
                instantUpload: true,

                server: {
                    process: (fieldName, file, metadata, load, error, progress, abort) => {
                        const formData = new FormData();
                        formData.append('file', file);
                        formData.append('project', project);

                        const request = new XMLHttpRequest();
                        request.open('POST', endpoint);

                        request.upload.onprogress = (e) => {
                            progress(e.lengthComputable, e.loaded, e.total);
                        };

                        request.onload = function() {
                            if (request.status >= 200 && request.status < 300) {
                                load(request.responseText);
                                if (document.getElementById('auto-clear').checked) {
                                    setTimeout(() => {
                                        pond.removeFile(file.id);
                                    }, 500); // Adding a delay to ensure the upload is fully complete
                                }
                            } else {
                                error(request.responseText);
                            }
                        };

                        request.onerror = function() {
                            error(request.responseText);
                        };

                        request.send(formData);

                        return {
                            abort: () => {
                                request.abort();
                                abort();
                            }
                        };
                    }
                }
            });

            // Store processed files
            const processedFiles = [];

            // Listen for the `processfile` event to track file processing
            pond.on('processfile', (error, file) => {
                if (error) {
                    console.error('File processing error:', error);
                } else {
                    console.log('File processed:', file.filename);
                    processedFiles.push(file.filename);
                    if (document.getElementById('auto-clear').checked) {
                        setTimeout(() => {
                            pond.removeFile(file.id);
                        }, 500); // Adding a delay to ensure the upload is fully complete
                    }
                }
            });

            // Toggle auto-upload functionality
            document.getElementById('auto-upload').addEventListener('change', function () {
                pond.setOptions({
                    instantUpload: this.checked
                });
                if (this.checked) {
                    pond.processFiles();
                }
            });

            // Toggle advanced settings
            const advancedSettingsToggle = document.querySelector('.advanced-settings-toggle');
            const advancedSettings = document.querySelector('.advanced-settings');

            advancedSettingsToggle.addEventListener('click', function () {
                if (advancedSettings.style.display === 'flex') {
                    advancedSettings.style.display = 'none';
                } else {
                    advancedSettings.style.display = 'flex';
                }
            });
        });
    </script>
</body>
</html>

  ''';
}

DateTime addTimetoCalenderDate(
  DateTime slotTime,
  DateTime calendarDate,
) {
  Duration timeToAdd = Duration(
    hours: slotTime.hour,
    minutes: slotTime.minute,
    seconds: slotTime.second,
    milliseconds: slotTime.millisecond,
  );

  DateTime result =
      DateTime(calendarDate.year, calendarDate.month, calendarDate.day)
          .add(timeToAdd);
  return result;
}

List<int> getOrderStats(List<OrdersRecord> orders) {
  int total = orders.length;
  int CAPTURED = 0;
  int FAILED = 0;
  int Initialization = 0;

  for (var order in orders) {
    final status = order.orderStatus;

    if (status == 'CAPTURED') {
      CAPTURED++;
    } else if (status == 'FAILED') {
      FAILED++;
    } else if (status == 'Initialization') {
      Initialization++;
    }
  }

  return [total, FAILED, CAPTURED, Initialization];
}

List<int> countOrdersByDesigner(
  List<OrdersRecord> orders,
  DocumentReference designerRef,
) {
  int total = 0;
  int CAPTURED = 0;
  int FAILED = 0;

  for (final order in orders) {
    final cartItems = order.orderItems.cartItems;

    if (cartItems == null) continue;

    bool hasMatch = false;

    for (final item in cartItems) {
      if (item.productDesignerRef == designerRef) {
        hasMatch = true;
        break;
      }
    }

    if (hasMatch) {
      total++;

      if (order.orderStatus == 'CAPTURED') {
        CAPTURED++;
      } else if (order.orderStatus == 'FAILED') {
        FAILED++;
      }
    }
  }

  return [total, CAPTURED, FAILED];
}

bool isDateBetween(
  DateTime startDate,
  DateTime endDate,
) {
  final now = DateTime.now();
  final currentDate = DateTime(now.year, now.month, now.day);
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);

  return currentDate.isAfter(start.subtract(const Duration(days: 1))) &&
      currentDate.isBefore(end.add(const Duration(days: 1)));
}

List<double> getlatlong(LatLng geolocation) {
  // 1. Access the latitude
  double lat = geolocation.latitude;

  // 2. Access the longitude
  double lng = geolocation.longitude;

  // 3. Return both as a List<double>
  return [lat, lng];
}

String? removeDoubleQuotes(String? content) {
  if (content == null) {
    return null;
  }
  if (content.startsWith('"') && content.endsWith('"')) {
    content = content.substring(1, content.length - 1);
  }
  return content;
}

List<dynamic> itemToJson(
  int? quantity,
  String? name,
  double? weight,
  String? weightUnit,
  String? skuNumber,
  String? description,
) {
  // i have send list of json to api input i want function to convert inputs into list of json format and return
  return [
    {
      'quantity': quantity,
      'name': name,
      'weight': weight,
      'weightUnit': weightUnit,
      'skuNumber': skuNumber,
      'description': description,
    }
  ];
}

List<String> getCountryList() {
  final countries = [
    "Afghanistan",
    "Aland Islands",
    "Albania",
    "Algeria",
    "AmericanSamoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "British Indian Ocean Territory",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Cayman Islands",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos (Keeling) Islands",
    "Colombia",
    "Comoros",
    "Congo",
    "Congo, The Democratic Republic of the Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote d'Ivoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands (Malvinas",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Guiana",
    "French Polynesia",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See (Vatican City State",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran, Islamic Republic of Persian Gulf",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, Democratic People's Republic of Korea",
    "Korea, Republic of South Korea",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libyan Arab Jamahiriya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macao",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia, Federated States of Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norfolk Island",
    "Northern Mariana Islands",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestinian Territory, Occupied",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Reunion",
    "Saint Barthelemy",
    "Saint Helena, Ascension and Tristan Da Cunha",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Martin",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "South Georgia and the South Sandwich Islands",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Svalbard and Jan Mayen",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syrian Arab Republic",
    "Taiwan",
    "Tajikistan",
    "Tanzania, United Republic of Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks and Caicos Islands",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela, Bolivarian Republic of Venezuela",
    "Vietnam",
    "Virgin Islands, British",
    "Virgin Islands, U.S",
    "Wallis and Futuna",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ];

  return countries;
}

List<String> filterUsersWithOrders(List<OrdersRecord> ordersList) {
  final Set<String> uniqueUserUids = {};

  // 1. Iterate through all the provided OrdersRecord objects.
  for (final OrdersRecord order in ordersList) {
    // 2. Access the user ID directly from the OrdersRecord.
    // NOTE: This assumes the Firestore field is 'customer_id', which translates
    // to the Dart property 'customerId' (camelCase).
    final String? userId = order.customerId;

    // 3. Check if the ID is not null or empty and add it to the Set.
    if (userId != null && userId.isNotEmpty) {
      // Sets automatically handle uniqueness.
      uniqueUserUids.add(userId);
    }
  }

  // 4. Convert the Set of unique UIDs back to a List and return it.
  return uniqueUserUids.toList();
}

List<CreatorPromotionsStruct> getUsersWithPromotions(
    List<UsersRecord> userList) {
  final List<CreatorPromotionsStruct> allPromotions = [];

  for (final user in userList) {
    // 1. Access the raw data map from the UsersRecord
    final Map<String, dynamic> userDataMap = user.snapshotData;

    // 2. Safely access the 'creator_main_info' map
    final dynamic mainInfoData = userDataMap['creator_main_info'];

    // Check if 'creator_main_info' exists and is a Map
    if (mainInfoData is! Map) {
      continue; // Skip if main info is missing or malformed
    }

    // Explicitly cast to Map<String, dynamic> for safe access
    final Map<String, dynamic> creatorMainInfo =
        mainInfoData.cast<String, dynamic>();

    // 3. Safely access the nested 'creator_promotions' list
    final dynamic promotionsData = creatorMainInfo['creator_promotions'];

    // 4. Check if the nested data is a List
    if (promotionsData is! List) {
      continue; // Skip if promotions list is missing or not a list
    }

    // 5. Iterate through the promotions and convert them to the target Struct
    final List<dynamic> rawPromotions = promotionsData;

    for (final rawPromotion in rawPromotions) {
      if (rawPromotion is Map<String, dynamic>) {
        // Convert the raw map/data for the promotion into the generated Struct.
        // This assumes CreatorPromotionsStruct has a static fromMap constructor.
        final CreatorPromotionsStruct promotionStruct =
            CreatorPromotionsStruct.fromMap(rawPromotion);
        allPromotions.add(promotionStruct);
      }
    }
  }

  return allPromotions;
}

List<UsersRecord> getUsersWithPromotionsCopy(
  List<UsersRecord> userList,
  String targetStatus,
) {
  final List<UsersRecord> filteredUsers = userList.where((user) {
    // Step 1: Convert UsersRecord to its map using snapshotData
    final Map<String, dynamic> userDataMap = user.snapshotData;

    // Step 2: Read "creator_promotions" safely
    final List<dynamic> creatorPromotions =
        (userDataMap['creator_promotions'] is List)
            ? userDataMap['creator_promotions'] as List<dynamic>
            : [];

    // Step 3: Check if any promotion matches the target status
    return creatorPromotions.any((promotion) {
      if (promotion is Map<String, dynamic>) {
        final status =
            promotion['promotion_status']?.toString().toLowerCase() ?? '';
        return status == targetStatus.toLowerCase();
      }
      return false;
    });
  }).toList();

  return filteredUsers;
}

bool isProductInDeliveryList(
  UserCartItemsStruct cartItem,
  List<DeliveryInfoStruct> deliveryInfoList,
) {
  String targetId = cartItem.productId;

  // 2. Loop through each DeliveryInfo object in the list.
  for (var deliveryGroup in deliveryInfoList) {
    if (deliveryGroup.status.trim().toUpperCase() != "CANCELLED") {
      // 4. Inside valid groups, check if the productIds list contains our targetId.
      if (deliveryGroup.productIds.contains(targetId)) {
        return true; // Match found in a non-cancelled delivery!
      }
    }
  }

  // 5. Return false if no matches are found in any active delivery groups.
  return false;
}

DateTime addHours(
  DateTime inputDate,
  int hoursToAdd,
) {
  return inputDate.add(Duration(hours: hoursToAdd));
}
