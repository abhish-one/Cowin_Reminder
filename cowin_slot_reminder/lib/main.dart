import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'driver.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Driver dv = Driver();

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cowin-reminder-application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'COWIN-REM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(children: [
          Column(children: <Widget>[
            ButtonSearchType(),
            VaccineType(),
            DoseNumber(),
            DatePickerDemo(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text(
                      'Notify Me',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: () async {
                      await dv.notify(context);
                      dv.clear();
                    },
                  ),
//                  MaterialButton(
//                    child: Text(
//                      ' Stop Me ',
//                      style: TextStyle(fontSize: 20.0, color: Colors.white),
//                    ),
//                    color: Colors.red,
//                    onPressed: () {
//                      dv.stopMe = 1;
//                    },
//                  )
                ],
              ),
            )
          ])
        ]));
  }
}


class ButtonSearchType extends StatefulWidget {
  @override
  ButtonSearchTypeState createState() => ButtonSearchTypeState();
}

//
class ButtonSearchTypeState extends State {
//
  String searchtype = 'pincode';
  String pincode;

  bool _isPressedButton1 = false;
  bool _isPressedButton2 = true;


  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 40, 0, 1),
        width: 900,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        )),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _isPressedButton1 = true;
                      _isPressedButton2 = false;
                      dv.searchType = 'district';
                      dv.pinCode = '';
                      searchtype = 'district';
                    });
                  },
                  shape: const StadiumBorder(),
                  textColor: _isPressedButton1 ? Colors.white : Colors.black,
                  color: _isPressedButton1 ? Colors.blue[900] : Colors.grey,
                  splashColor: Colors.blue[900],
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  child: Text('Search By District'),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _isPressedButton1 = false;
                      _isPressedButton2 = true;
                      searchtype = 'pincode';
                      dv.searchType = 'pincode';
                      dv.state = '';
                    });
                    ;
                  },
                  shape: const StadiumBorder(),
                  textColor: _isPressedButton2 ? Colors.white : Colors.black,
                  color: _isPressedButton2 ? Colors.blue[900] : Colors.grey,
                  splashColor: Colors.blue[900],
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  child: Text('Search By Pincode'),
                ),
              ],
            ),



            if ('$searchtype' == "district") Indianstate(),
            if ('$searchtype' == "pincode")
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                  //    border: Border.all()
                  ),

                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 50, bottom: 15),
                  child: TextField(
                    onSubmitted: (value) {
                      pincode = value;
                      dv.pinCode = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Pin code'),
                  )),
          ],
        ));
  }
}

class Indianstate extends StatefulWidget {
  @override
  IndianstateState createState() => IndianstateState();
}

class IndianstateState extends State<Indianstate> {
  String state;

  String district;

  var data = {
    'Andaman and Nicobar Islands': {
      'Nicobar': 3,
      'North and Middle Andaman': 1,
      'South Andaman': 2
    },
    'Andhra Pradesh': {
      'Anantapur': 9,
      'Chittoor': 10,
      'East Godavari': 11,
      'Guntur': 5,
      'Krishna': 4,
      'Kurnool': 7,
      'Prakasam': 12,
      'Sri Potti Sriramulu Nellore': 13,
      'Srikakulam': 14,
      'Visakhapatnam': 8,
      'Vizianagaram': 15,
      'West Godavari': 16,
      'YSR District, Kadapa (Cuddapah)': 6
    },
    'Arunachal Pradesh': {
      'Anjaw': 22,
      'Changlang': 20,
      'Dibang Valley': 25,
      'East Kameng': 23,
      'East Siang': 42,
      'Itanagar Capital Complex': 17,
      'Kamle': 24,
      'Kra Daadi': 27,
      'Kurung Kumey': 21,
      'Lepa Rada': 33,
      'Lohit': 29,
      'Longding': 40,
      'Lower Dibang Valley': 31,
      'Lower Siang': 18,
      'Lower Subansiri': 32,
      'Namsai': 36,
      'Pakke Kessang': 19,
      'Papum Pare': 39,
      'Shi Yomi': 35,
      'Siang': 37,
      'Tawang': 30,
      'Tirap': 26,
      'Upper Siang': 34,
      'Upper Subansiri': 41,
      'West Kameng': 28,
      'West Siang': 38
    },
    'Assam': {
      'Baksa': 46,
      'Barpeta': 47,
      'Biswanath': 765,
      'Bongaigaon': 57,
      'Cachar': 66,
      'Charaideo': 766,
      'Chirang': 58,
      'Darrang': 48,
      'Dhemaji': 62,
      'Dhubri': 59,
      'Dibrugarh': 43,
      'Dima Hasao': 67,
      'Goalpara': 60,
      'Golaghat': 53,
      'Hailakandi': 68,
      'Hojai': 764,
      'Jorhat': 54,
      'Kamrup Metropolitan': 49,
      'Kamrup Rural': 50,
      'Karbi-Anglong': 51,
      'Karimganj': 69,
      'Kokrajhar': 61,
      'Lakhimpur': 63,
      'Majuli': 767,
      'Morigaon': 55,
      'Nagaon': 56,
      'Nalbari': 52,
      'Sivasagar': 44,
      'Sonitpur': 64,
      'South Salmara Mankachar': 768,
      'Tinsukia': 45,
      'Udalguri': 65,
      'West Karbi Anglong': 769
    },
    'Bihar': {
      'Araria': 74,
      'Arwal': 78,
      'Aurangabad': 77,
      'Banka': 83,
      'Begusarai': 98,
      'Bhagalpur': 82,
      'Bhojpur': 99,
      'Buxar': 100,
      'Darbhanga': 94,
      'East Champaran': 105,
      'Gaya': 79,
      'Gopalganj': 104,
      'Jamui': 107,
      'Jehanabad': 91,
      'Kaimur': 80,
      'Katihar': 75,
      'Khagaria': 101,
      'Kishanganj': 76,
      'Lakhisarai': 84,
      'Madhepura': 70,
      'Madhubani': 95,
      'Munger': 85,
      'Muzaffarpur': 86,
      'Nalanda': 90,
      'Nawada': 92,
      'Patna': 97,
      'Purnia': 73,
      'Rohtas': 81,
      'Saharsa': 71,
      'Samastipur': 96,
      'Saran': 102,
      'Sheikhpura': 93,
      'Sheohar': 87,
      'Sitamarhi': 88,
      'Siwan': 103,
      'Supaul': 72,
      'Vaishali': 89,
      'West Champaran': 106
    },
    'Chandigarh': {'Chandigarh': 108},
    'Chhattisgarh': {
      'Balod': 110,
      'Baloda bazar': 111,
      'Balrampur': 112,
      'Bastar': 113,
      'Bemetara': 114,
      'Bijapur': 115,
      'Bilaspur': 116,
      'Dantewada': 117,
      'Dhamtari': 118,
      'Durg': 119,
      'Gariaband': 120,
      'Gaurela Pendra Marwahi ': 136,
      'Janjgir-Champa': 121,
      'Jashpur': 122,
      'Kanker': 123,
      'Kawardha': 135,
      'Kondagaon': 124,
      'Korba': 125,
      'Koriya': 126,
      'Mahasamund': 127,
      'Mungeli': 128,
      'Narayanpur': 129,
      'Raigarh': 130,
      'Raipur': 109,
      'Rajnandgaon': 131,
      'Sukma': 132,
      'Surajpur': 133,
      'Surguja': 134
    },
    'Dadra and Nagar Haveli': {'Dadra and Nagar Haveli': 137},
    'Daman and Diu': {'Daman': 138, 'Diu': 139},
    'Delhi': {
      'Central Delhi': 141,
      'East Delhi': 145,
      'New Delhi': 140,
      'North Delhi': 146,
      'North East Delhi': 147,
      'North West Delhi': 143,
      'Shahdara': 148,
      'South Delhi': 149,
      'South East Delhi': 144,
      'South West Delhi': 150,
      'West Delhi': 142
    },
    'Goa': {'North Goa': 151, 'South Goa': 152},
    'Gujarat': {
      'Ahmedabad': 154,
      'Ahmedabad Corporation': 770,
      'Amreli': 174,
      'Anand': 179,
      'Aravalli': 158,
      'Banaskantha': 159,
      'Bharuch': 180,
      'Bhavnagar': 175,
      'Bhavnagar Corporation': 771,
      'Botad': 176,
      'Chhotaudepur': 181,
      'Dahod': 182,
      'Dang': 163,
      'Devbhumi Dwaraka': 168,
      'Gandhinagar': 153,
      'Gandhinagar Corporation': 772,
      'Gir Somnath': 177,
      'Jamnagar': 169,
      'Jamnagar Corporation': 773,
      'Junagadh': 178,
      'Junagadh Corporation': 774,
      'Kheda': 156,
      'Kutch': 170,
      'Mahisagar': 183,
      'Mehsana': 160,
      'Morbi': 171,
      'Narmada': 184,
      'Navsari': 164,
      'Panchmahal': 185,
      'Patan': 161,
      'Porbandar': 172,
      'Rajkot': 173,
      'Rajkot Corporation': 775,
      'Sabarkantha': 162,
      'Surat': 165,
      'Surat Corporation': 776,
      'Surendranagar': 157,
      'Tapi': 166,
      'Vadodara': 155,
      'Vadodara Corporation': 777,
      'Valsad': 167
    },
    'Haryana': {
      'Ambala': 193,
      'Bhiwani': 200,
      'Charkhi Dadri': 201,
      'Faridabad': 199,
      'Fatehabad': 196,
      'Gurgaon': 188,
      'Hisar': 191,
      'Jhajjar': 189,
      'Jind': 204,
      'Kaithal': 190,
      'Karnal': 203,
      'Kurukshetra': 186,
      'Mahendragarh': 206,
      'Nuh': 205,
      'Palwal': 207,
      'Panchkula': 187,
      'Panipat': 195,
      'Rewari': 202,
      'Rohtak': 192,
      'Sirsa': 194,
      'Sonipat': 198,
      'Yamunanagar': 197
    },
    'Himachal Pradesh': {
      'Bilaspur': 219,
      'Chamba': 214,
      'Hamirpur': 217,
      'Kangra': 213,
      'Kinnaur': 216,
      'Kullu': 211,
      'Lahaul Spiti': 210,
      'Mandi': 215,
      'Shimla': 208,
      'Sirmaur': 212,
      'Solan': 209,
      'Una': 218
    },
    'Jammu and Kashmir': {
      'Anantnag': 224,
      'Bandipore': 223,
      'Baramulla': 225,
      'Budgam': 229,
      'Doda': 232,
      'Ganderbal': 228,
      'Jammu': 230,
      'Kathua': 234,
      'Kishtwar': 231,
      'Kulgam': 221,
      'Kupwara': 226,
      'Poonch': 238,
      'Pulwama': 227,
      'Rajouri': 237,
      'Ramban': 235,
      'Reasi': 239,
      'Samba': 236,
      'Shopian': 222,
      'Srinagar': 220,
      'Udhampur': 233
    },
    'Jharkhand': {
      'Bokaro': 242,
      'Chatra': 245,
      'Deoghar': 253,
      'Dhanbad': 257,
      'Dumka': 258,
      'East Singhbhum': 247,
      'Garhwa': 243,
      'Giridih': 256,
      'Godda': 262,
      'Gumla': 251,
      'Hazaribagh': 255,
      'Jamtara': 259,
      'Khunti': 252,
      'Koderma': 241,
      'Latehar': 244,
      'Lohardaga': 250,
      'Pakur': 261,
      'Palamu': 246,
      'Ramgarh': 254,
      'Ranchi': 240,
      'Sahebganj': 260,
      'Seraikela Kharsawan': 248,
      'Simdega': 249,
      'West Singhbhum': 263
    },
    'Karnataka': {
      'Bagalkot': 270,
      'Bangalore Rural': 276,
      'Bangalore Urban': 265,
      'BBMP': 294,
      'Belgaum': 264,
      'Bellary': 274,
      'Bidar': 272,
      'Chamarajanagar': 271,
      'Chikamagalur': 273,
      'Chikkaballapur': 291,
      'Chitradurga': 268,
      'Dakshina Kannada': 269,
      'Davanagere': 275,
      'Dharwad': 278,
      'Gadag': 280,
      'Gulbarga': 267,
      'Hassan': 289,
      'Haveri': 279,
      'Kodagu': 283,
      'Kolar': 277,
      'Koppal': 282,
      'Mandya': 290,
      'Mysore': 266,
      'Raichur': 284,
      'Ramanagara': 292,
      'Shimoga': 287,
      'Tumkur': 288,
      'Udupi': 286,
      'Uttar Kannada': 281,
      'Vijayapura': 293,
      'Yadgir': 285
    },
    'Kerala': {
      'Alappuzha': 301,
      'Ernakulam': 307,
      'Idukki': 306,
      'Kannur': 297,
      'Kasaragod': 295,
      'Kollam': 298,
      'Kottayam': 304,
      'Kozhikode': 305,
      'Malappuram': 302,
      'Palakkad': 308,
      'Pathanamthitta': 300,
      'Thiruvananthapuram': 296,
      'Thrissur': 303,
      'Wayanad': 299
    },
    'Ladakh': {'Kargil': 309, 'Leh': 310},
    'Lakshadweep': {'Agatti Island': 796, 'Lakshadweep': 311},
    'Madhya Pradesh': {
      'Agar': 320,
      'Alirajpur': 357,
      'Anuppur': 334,
      'Ashoknagar': 354,
      'Balaghat': 338,
      'Barwani': 343,
      'Betul': 362,
      'Bhind': 351,
      'Bhopal': 312,
      'Burhanpur': 342,
      'Chhatarpur': 328,
      'Chhindwara': 337,
      'Damoh': 327,
      'Datia': 350,
      'Dewas': 324,
      'Dhar': 341,
      'Dindori': 336,
      'Guna': 348,
      'Gwalior': 313,
      'Harda': 361,
      'Hoshangabad': 360,
      'Indore': 314,
      'Jabalpur': 315,
      'Jhabua': 340,
      'Katni': 353,
      'Khandwa': 339,
      'Khargone': 344,
      'Mandla': 335,
      'Mandsaur': 319,
      'Morena': 347,
      'Narsinghpur': 352,
      'Neemuch': 323,
      'Panna': 326,
      'Raisen': 359,
      'Rajgarh': 358,
      'Ratlam': 322,
      'Rewa': 316,
      'Sagar': 317,
      'Satna': 333,
      'Sehore': 356,
      'Seoni': 349,
      'Shahdol': 332,
      'Shajapur': 321,
      'Sheopur': 346,
      'Shivpuri': 345,
      'Sidhi': 331,
      'Singrauli': 330,
      'Tikamgarh': 325,
      'Ujjain': 318,
      'Umaria': 329,
      'Vidisha': 355
    },
    'Maharashtra': {
      'Ahmednagar': 391,
      'Akola': 364,
      'Amravati': 366,
      'Aurangabad ': 397,
      'Beed': 384,
      'Bhandara': 370,
      'Buldhana': 367,
      'Chandrapur': 380,
      'Dhule': 388,
      'Gadchiroli': 379,
      'Gondia': 378,
      'Hingoli': 386,
      'Jalgaon': 390,
      'Jalna': 396,
      'Kolhapur': 371,
      'Latur': 383,
      'Mumbai': 395,
      'Nagpur': 365,
      'Nanded': 382,
      'Nandurbar': 387,
      'Nashik': 389,
      'Osmanabad': 381,
      'Palghar': 394,
      'Parbhani': 385,
      'Pune': 363,
      'Raigad': 393,
      'Ratnagiri': 372,
      'Sangli': 373,
      'Satara': 376,
      'Sindhudurg': 374,
      'Solapur': 375,
      'Thane': 392,
      'Wardha': 377,
      'Washim': 369,
      'Yavatmal': 368
    },
    'Manipur': {
      'Bishnupur': 398,
      'Chandel': 399,
      'Churachandpur': 400,
      'Imphal East': 401,
      'Imphal West': 402,
      'Jiribam': 410,
      'Kakching': 413,
      'Kamjong': 409,
      'Kangpokpi': 408,
      'Noney': 412,
      'Pherzawl': 411,
      'Senapati': 403,
      'Tamenglong': 404,
      'Tengnoupal': 407,
      'Thoubal': 405,
      'Ukhrul': 406
    },
    'Meghalaya': {
      'East Garo Hills': 424,
      'East Jaintia Hills': 418,
      'East Khasi Hills': 414,
      'North Garo Hills': 423,
      'Ri-Bhoi': 417,
      'South Garo Hills': 421,
      'South West Garo Hills': 422,
      'South West Khasi Hills': 415,
      'West Garo Hills': 420,
      'West Jaintia Hills': 416,
      'West Khasi Hills': 419
    },
    'Mizoram': {
      'Aizawl East': 425,
      'Aizawl West': 426,
      'Champhai': 429,
      'Kolasib': 428,
      'Lawngtlai': 432,
      'Lunglei': 431,
      'Mamit': 427,
      'Serchhip': 430,
      'Siaha': 433
    },
    'Nagaland': {
      'Dimapur': 434,
      'Kiphire': 444,
      'Kohima': 441,
      'Longleng': 438,
      'Mokokchung': 437,
      'Mon': 439,
      'Peren': 435,
      'Phek': 443,
      'Tuensang': 440,
      'Wokha': 436,
      'Zunheboto': 442
    },
    'Odisha': {
      'Angul': 445,
      'Balangir': 448,
      'Balasore': 447,
      'Bargarh': 472,
      'Bhadrak': 454,
      'Boudh': 468,
      'Cuttack': 457,
      'Deogarh': 473,
      'Dhenkanal': 458,
      'Gajapati': 467,
      'Ganjam': 449,
      'Jagatsinghpur': 459,
      'Jajpur': 460,
      'Jharsuguda': 474,
      'Kalahandi': 464,
      'Kandhamal': 450,
      'Kendrapara': 461,
      'Kendujhar': 455,
      'Khurda': 446,
      'Koraput': 451,
      'Malkangiri': 469,
      'Mayurbhanj': 456,
      'Nabarangpur': 470,
      'Nayagarh': 462,
      'Nuapada': 465,
      'Puri': 463,
      'Rayagada': 471,
      'Sambalpur': 452,
      'Subarnapur': 466,
      'Sundargarh': 453
    },
    'Puducherry': {
      'Karaikal': 476,
      'Mahe': 477,
      'Puducherry': 475,
      'Yanam': 478
    },
    'Punjab': {
      'Amritsar': 485,
      'Barnala': 483,
      'Bathinda': 493,
      'Faridkot': 499,
      'Fatehgarh Sahib': 484,
      'Fazilka': 487,
      'Ferozpur': 480,
      'Gurdaspur': 489,
      'Hoshiarpur': 481,
      'Jalandhar': 492,
      'Kapurthala': 479,
      'Ludhiana': 488,
      'Mansa': 482,
      'Moga': 491,
      'Pathankot': 486,
      'Patiala': 494,
      'Rup Nagar': 497,
      'Sangrur': 498,
      'SAS Nagar': 496,
      'SBS Nagar': 500,
      'Sri Muktsar Sahib': 490,
      'Tarn Taran': 495
    },
    'Rajasthan': {
      'Ajmer': 507,
      'Alwar': 512,
      'Banswara': 519,
      'Baran': 516,
      'Barmer': 528,
      'Bharatpur': 508,
      'Bhilwara': 523,
      'Bikaner': 501,
      'Bundi': 514,
      'Chittorgarh': 521,
      'Churu': 530,
      'Dausa': 511,
      'Dholpur': 524,
      'Dungarpur': 520,
      'Hanumangarh': 517,
      'Jaipur I': 505,
      'Jaipur II': 506,
      'Jaisalmer': 527,
      'Jalore': 533,
      'Jhalawar': 515,
      'Jhunjhunu': 510,
      'Jodhpur': 502,
      'Karauli': 525,
      'Kota': 503,
      'Nagaur': 532,
      'Pali': 529,
      'Pratapgarh': 522,
      'Rajsamand': 518,
      'Sawai Madhopur': 534,
      'Sikar': 513,
      'Sirohi': 531,
      'Sri Ganganagar': 509,
      'Tonk': 526,
      'Udaipur': 504
    },
    'Sikkim': {
      'East Sikkim': 535,
      'North Sikkim': 537,
      'South Sikkim': 538,
      'West Sikkim': 536
    },
    'Tamil Nadu': {
      'Aranthangi': 779,
      'Ariyalur': 555,
      'Attur': 578,
      'Chengalpet': 565,
      'Chennai': 571,
      'Cheyyar': 778,
      'Coimbatore': 539,
      'Cuddalore': 547,
      'Dharmapuri': 566,
      'Dindigul': 556,
      'Erode': 563,
      'Kallakurichi': 552,
      'Kanchipuram': 557,
      'Kanyakumari': 544,
      'Karur': 559,
      'Kovilpatti': 780,
      'Krishnagiri': 562,
      'Madurai': 540,
      'Nagapattinam': 576,
      'Namakkal': 558,
      'Nilgiris': 577,
      'Palani': 564,
      'Paramakudi': 573,
      'Perambalur': 570,
      'Poonamallee': 575,
      'Pudukkottai': 546,
      'Ramanathapuram': 567,
      'Ranipet': 781,
      'Salem': 545,
      'Sivaganga': 561,
      'Sivakasi': 580,
      'Tenkasi': 551,
      'Thanjavur': 541,
      'Theni': 569,
      'Thoothukudi (Tuticorin)': 554,
      'Tiruchirappalli': 560,
      'Tirunelveli': 548,
      'Tirupattur': 550,
      'Tiruppur': 568,
      'Tiruvallur': 572,
      'Tiruvannamalai': 553,
      'Tiruvarur': 574,
      'Vellore': 543,
      'Viluppuram': 542,
      'Virudhunagar': 549
    },
    'Telangana': {
      'Adilabad': 582,
      'Bhadradri Kothagudem': 583,
      'Hyderabad': 581,
      'Jagtial': 584,
      'Jangaon': 585,
      'Jayashankar Bhupalpally': 586,
      'Jogulamba Gadwal': 587,
      'Kamareddy': 588,
      'Karimnagar': 589,
      'Khammam': 590,
      'Kumuram Bheem': 591,
      'Mahabubabad': 592,
      'Mahabubnagar': 593,
      'Mancherial': 594,
      'Medak': 595,
      'Medchal': 596,
      'Mulugu': 612,
      'Nagarkurnool': 597,
      'Nalgonda': 598,
      'Narayanpet': 613,
      'Nirmal': 599,
      'Nizamabad': 600,
      'Peddapalli': 601,
      'Rajanna Sircilla': 602,
      'Rangareddy': 603,
      'Sangareddy': 604,
      'Siddipet': 605,
      'Suryapet': 606,
      'Vikarabad': 607,
      'Wanaparthy': 608,
      'Warangal(Rural)': 609,
      'Warangal(Urban)': 610,
      'Yadadri Bhuvanagiri': 611
    },
    'Tripura': {
      'Dhalai': 614,
      'Gomati': 615,
      'Khowai': 616,
      'North Tripura': 617,
      'Sepahijala': 618,
      'South Tripura': 619,
      'Unakoti': 620,
      'West Tripura': 621
    },
    'Uttar Pradesh': {
      'Agra': 622,
      'Aligarh': 623,
      'Ambedkar Nagar': 625,
      'Amethi': 626,
      'Amroha': 627,
      'Auraiya': 628,
      'Ayodhya': 646,
      'Azamgarh': 629,
      'Badaun': 630,
      'Baghpat': 631,
      'Bahraich': 632,
      'Balarampur': 633,
      'Ballia': 634,
      'Banda': 635,
      'Barabanki': 636,
      'Bareilly': 637,
      'Basti': 638,
      'Bhadohi': 687,
      'Bijnour': 639,
      'Bulandshahr': 640,
      'Chandauli': 641,
      'Chitrakoot': 642,
      'Deoria': 643,
      'Etah': 644,
      'Etawah': 645,
      'Farrukhabad': 647,
      'Fatehpur': 648,
      'Firozabad': 649,
      'Gautam Buddha Nagar': 650,
      'Ghaziabad': 651,
      'Ghazipur': 652,
      'Gonda': 653,
      'Gorakhpur': 654,
      'Hamirpur': 655,
      'Hapur': 656,
      'Hardoi': 657,
      'Hathras': 658,
      'Jalaun': 659,
      'Jaunpur': 660,
      'Jhansi': 661,
      'Kannauj': 662,
      'Kanpur Dehat': 663,
      'Kanpur Nagar': 664,
      'Kasganj': 665,
      'Kaushambi': 666,
      'Kushinagar': 667,
      'Lakhimpur Kheri': 668,
      'Lalitpur': 669,
      'Lucknow': 670,
      'Maharajganj': 671,
      'Mahoba': 672,
      'Mainpuri': 673,
      'Mathura': 674,
      'Mau': 675,
      'Meerut': 676,
      'Mirzapur': 677,
      'Moradabad': 678,
      'Muzaffarnagar': 679,
      'Pilibhit': 680,
      'Pratapgarh': 682,
      'Prayagraj': 624,
      'Raebareli': 681,
      'Rampur': 683,
      'Saharanpur': 684,
      'Sambhal': 685,
      'Sant Kabir Nagar': 686,
      'Shahjahanpur': 688,
      'Shamli': 689,
      'Shravasti': 690,
      'Siddharthnagar': 691,
      'Sitapur': 692,
      'Sonbhadra': 693,
      'Sultanpur': 694,
      'Unnao': 695,
      'Varanasi': 696
    },
    'Uttarakhand': {
      'Almora': 704,
      'Bageshwar': 707,
      'Chamoli': 699,
      'Champawat': 708,
      'Dehradun': 697,
      'Haridwar': 702,
      'Nainital': 709,
      'Pauri Garhwal': 698,
      'Pithoragarh': 706,
      'Rudraprayag': 700,
      'Tehri Garhwal': 701,
      'Udham Singh Nagar': 705,
      'Uttarkashi': 703
    },
    'West Bengal': {
      'Alipurduar District': 710,
      'Bankura': 711,
      'Basirhat HD (North 24 Parganas)': 712,
      'Birbhum': 713,
      'Bishnupur HD (Bankura)': 714,
      'Cooch Behar': 715,
      'COOCHBEHAR': 783,
      'Dakshin Dinajpur': 716,
      'Darjeeling': 717,
      'Diamond Harbor HD (S 24 Parganas)': 718,
      'East Bardhaman': 719,
      'Hoogly': 720,
      'Howrah': 721,
      'Jalpaiguri': 722,
      'Jhargram': 723,
      'Kalimpong': 724,
      'Kolkata': 725,
      'Malda': 726,
      'Murshidabad': 727,
      'Nadia': 728,
      'Nandigram HD (East Medinipore)': 729,
      'North 24 Parganas': 730,
      'Paschim Medinipore': 731,
      'Purba Medinipore': 732,
      'Purulia': 733,
      'Rampurhat HD (Birbhum)': 734,
      'South 24 Parganas': 735,
      'Uttar Dinajpur': 736,
      'West Bardhaman': 737
    }
  };

  List<String> districts = []; //district
  List<String> setDistrict(state) {
    var districts = data[state];
    var names = districts.keys.toList();
    return names;
  }

  int getDistrictId(district, state) {
    var districts = data[state];
    var id = districts[district];
    return id;
  }

  List<DropdownMenuItem> doubleList1;

  @override
  Widget build(BuildContext context) {
    List<String> states = data.keys.toList(); //state
    return Container(
        //color: Colors.pink,
        width: 500,
        height: 120,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  //   color: Colors.yellow,
                  height: 40,
                  width: 550,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: DropdownButton<String>(
                    hint: Text('Select State'),
                    value: state,
                    isExpanded: true,
                    items: states.map((String val) {
                      return DropdownMenuItem<String>(
                          value: val, child: Text(val));
                    }).toList(),
                    onChanged: (selectedState) {
                      districts = setDistrict(selectedState);
                      setState(() {
                        state = selectedState;
                        district = null;
                        dv.state = selectedState;
                      });
                    },
                  )),
              Container(
                //color: Colors.pinkAccent,
                height: 40,
                width: 550,

                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 20),
                child: DropdownButton<String>(
                  hint: Text('Select District'),
                  value: district,
                  isExpanded: true,
                  items: districts.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (selectedDistrict) {
                    setState(() {
                      district = selectedDistrict;
                      dv.districtId = getDistrictId(selectedDistrict, state);
                    });
                  },
                ),
              )
            ]));
  }
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  /// Which holds the selected date
  /// Defaults to today's date.
//  DateTime selectedDate = DateTime.now();
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 11))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2022),
        selectableDayPredicate: _decideWhichDayToEnable);
    if (picked != null && picked != dv.date)
      setState(() {
        dv.date = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 500,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(1.0, 1.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
           // border: Border.all()
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "${dv.date.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select date',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.lightBlue,
            )
          ],
        ));
  }
}

class DoseNumber extends StatefulWidget {
  @override
  DoseNumberState createState() => DoseNumberState();
}

class DoseNumberState extends State {
//  String dosenumber = '';

  Widget build(BuildContext context) {
    return Container(
        //color: Colors.grey,
        height: 180,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
        //    border: Border.all()
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(

                margin: const EdgeInsets.only(
                    top: 0, left: 0, right: 0, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue.shade700,

                ),
                child: Row(

                    children: [
                  FlatButton.icon(
                    label: const Text(
                      'Dose 1      ',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Radio(
                      value: 'available_capacity_dose1',
                      groupValue: dv.doseNumber,
                      activeColor: Colors.white,
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          dv.doseNumber = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        dv.doseNumber = 'available_capacity_dose1';
                      });
                    },
                  ),
                  FlatButton.icon(
                    label: const Text('Dose 2',
                        style: TextStyle(color: Colors.white)),
                    icon: Radio(
                      value: 'available_capacity_dose2',
                      groupValue: dv.doseNumber,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          dv.doseNumber = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        dv.doseNumber = 'available_capacity_dose2';
                      });
                    },
                  )
                ])),
            Container(
              margin:
                  const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue.shade700,
                  //  boxShadow: [
//                BoxShadow(
//                  color: Colors.blueAccent[200],
//                  offset: const Offset(
//                    5.0,
//                    5.0,
//                  ),
//                  blurRadius: 5.0,
//                  spreadRadius: 2.0,
//                ), //BoxShadow
//                BoxShadow(
//                  color: Colors.white,
//                  offset: const Offset(0.0, 0.0),
//                  blurRadius: 0.0,
//                  spreadRadius: 0.0,
//                ), //BoxShadow
                  //   ],
                  border: Border()),
              child: Row(
                children: [
                  FlatButton.icon(
                    label: const Text(
                      'Age 45+   ',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Radio(
                      value: 45,
                      activeColor: Colors.white,
                      groupValue: dv.minAgeLimit,
                      onChanged: (value) {
                        setState(() {
                          dv.minAgeLimit = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        dv.minAgeLimit = 45;
                      });
                    },
                  ),
                  FlatButton.icon(
                    label: const Text('Age 18-44',
                        style: TextStyle(color: Colors.white)),
                    icon: Radio(
                      value: 18,
                      activeColor: Colors.white,
                      groupValue: dv.minAgeLimit,
                      onChanged: (value) {
                        setState(() {
                          dv.minAgeLimit = value;
                        });
                      },
                    ),
                    onPressed: () {
                      setState(() {
                        dv.minAgeLimit = 18;
                      });
                    },
                  )
                ],
              ),
            ),
          ],
//        RadioListTile(
//              groupValue: dv.doseNumber,
//              title: Text('Dose 1'),
//              value: 'available_capacity_dose1',
//              onChanged: (val) {
//                setState(() {
//                  dv.doseNumber = val;
//                });
//              },
//            ),
//          RadioListTile(
//                groupValue: dv.doseNumber,
//                title: Text('Dose 2'),
//                value: 'available_capacity_dose2',
//                onChanged: (val) {
//                  setState(() {
//                    dv.doseNumber = val;
//                  });
//                },
//              ),
        )
        //       Container(
//          children:[ Container(
//            //color: Colors.red,
//            child: RadioListTile(
//              groupValue: dv.doseNumber,
//              title: Text('18+'),
//              value: 'available_capacity_dose1',
//              onChanged: (val) {
//                setState(() {
//                  dv.doseNumber = val;
//                });
//              },
//            ),
//          ),
//            Container(
//              //color: Colors.red,
//              child: RadioListTile(
//                groupValue: dv.doseNumber,
//                title: Text('45+'),
//                value: 'available_capacity_dose1',
//                onChanged: (val) {
//                  setState(() {
//                    dv.doseNumber = val;
//                  });
//                },
//              ),
//            ),

        );
  }
}

class VaccineType extends StatefulWidget {
  @override
  VaccineTypeState createState() => VaccineTypeState();
}

class VaccineTypeState extends State<VaccineType> {
  String vaccine;

  @override
  Widget build(BuildContext context) {
    List<String> vaccineList = ["COVISHIELD", "COVAXIN", "SPUTNIK V", "Any"];
    List<DropdownMenuItem> menuItemList = vaccineList
        .map((val) => DropdownMenuItem(value: val, child: Text(val)))
        .toList();
    return Container(
      //color: Colors.brown,
      width: 550,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
      //    border: Border.all()
      ),
      child: DropdownButton<String>(
          isExpanded: true,
          items: menuItemList,
          hint: Text('Select Vaccine Type'),
          onChanged: (value) {
            setState(() {
              vaccine = value;
              dv.vaccineType = value;
            });
          },
          value: vaccine),
    );
  }
}