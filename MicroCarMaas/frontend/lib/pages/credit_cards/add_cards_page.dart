import 'package:flutter/material.dart';
import 'package:frontend/pages/credit_cards/cards_page.dart';

class AddCardsPage extends StatefulWidget {
  final String? cardName;
  final String? cardNumber;

  const AddCardsPage({Key? key, this.cardName, this.cardNumber})
      : super(key: key);

  @override
  State<AddCardsPage> createState() => _AddCardsPageState();
}

class _AddCardsPageState extends State<AddCardsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _cardName;
  String? _cardNumber;
  String? _selectedMonth;
  String? _selectedYear;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;

    int currentYear = DateTime.now().year;
    List<String> years =
        List.generate(95, (index) => (currentYear - 94 + index).toString());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Ödeme Bilgilerim",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 158, 152, 1.0),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); //önceki sayfaya geçiş
          },
        ),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Kart Ekle",
                          style: TextStyle(
                              color: Color.fromRGBO(14, 187, 178, 1),
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFAFCDCB),
                          filled: true,
                          hintText: "   Kart İsmi",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kart ismi boş bırakılamaz";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _cardName = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFAFCDCB),
                          filled: true,
                          hintText: "   Kart Numarası",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kart numarası boş bırakılamaz";
                          }
                          if (value.length != 16) {
                            return "Geçersiz kart numarası";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _cardNumber = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedMonth,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedMonth = newValue;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFAFCDCB),
                                filled: true,
                                hintText: "   Ay",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ay boş bırakılamaz";
                                }
                                return null;
                              },
                              items: <String>[
                                'Ocak',
                                'Şubat',
                                'Mart',
                                'Nisan',
                                'Mayıs',
                                'Haziran',
                                'Temmuz',
                                'Ağustos',
                                'Eylül',
                                'Ekim',
                                'Kasım',
                                'Aralık',
                                // Add other months as needed
                              ].map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedYear,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedYear = newValue;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFAFCDCB),
                                filled: true,
                                hintText: "   Yıl",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Yıl boş bırakılamaz";
                                }
                                return null;
                              },
                              items: years.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Doğrulama başarılı, devam et
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardsPage(
                                    cardName: _cardName,
                                    cardNumber: _cardNumber,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 11,
                            backgroundColor: Color.fromRGBO(53, 149, 143, 1),
                          ),
                          child: const Text(
                            "Ekle",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Text(
                        "Ödeme altyapımız Masterpass \ntarafından sağlanmaktadır ve işlem \ngüvenliği Mastercard güvencesi\n altındadır.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF757575),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/Masterpass_logo.png",
                              width: 120,
                              height: 120,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/cards_logo.png",
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
