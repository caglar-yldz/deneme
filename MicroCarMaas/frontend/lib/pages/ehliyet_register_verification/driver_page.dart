import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/profil/profil_page.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  DateTime? _selectedAlimDate;
  DateTime? _selectedGecerlilikDate;
  final _formKey = GlobalKey<FormState>();
  final RegExp _tcRegExp = RegExp(r'^\d{11}$');
  File? _image;

  String? _validateDriverDate2(DateTime? value) {
    if (value == null) {
      return "Ehliyet Alım Tarihi boş olamaz";
    }
    return null;
  }

  String? _validateDriverDate(DateTime? value) {
    if (value == null) {
      return "Ehliyet Geçerlilik Tarihi boş olamaz";
    }
    return null;
  }

  String? _validateTC(String? value) {
    if (value == null || value.isEmpty) {
      return "TC Kimlik Numarası boş olamaz";
    } else if (!_tcRegExp.hasMatch(value)) {
      return "Geçersiz TC Kimlik Numarası";
    }
    return null;
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 80,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Hesap Oluştur",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(223, 14, 156, 111)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ehliyet Bilgilerini Tamamla",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(223, 14, 156, 111)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Lütfen ehliyetinin ön ve arka yüzlerinin fotoğraflarını yükleyiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(223, 14, 156, 111)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/driverLicense.png",
                          width: 120, // Genişlik
                          height: 120, // Yükseklik
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/driverLicense.png",
                          width: 120, // Genişlik
                          height: 120, // Yükseklik
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Lütfen eksik bilgileri tamamlayınız.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(223, 14, 156, 111)),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: "   TC Kimlik No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    validator: _validateTC,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: "   Ehliyet No",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                        return "Ehliyet No boş olamaz";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedAlimDate = pickedDate;
                        });
                      }
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: _selectedAlimDate == null
                          ? "   Ehliyet Alım Tarihi "
                          : "   ${DateFormat('dd/MM/yyyy').format(_selectedAlimDate!)}",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    validator: (_) => _validateDriverDate2(_selectedAlimDate),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedGecerlilikDate = pickedDate;
                        });
                      }
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: _selectedGecerlilikDate == null
                          ? "   Ehliyet Geçerlilik Tarihi "
                          : "   ${DateFormat('dd/MM/yyyy').format(_selectedGecerlilikDate!)}",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    validator: (_) =>
                        _validateDriverDate(_selectedGecerlilikDate),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 60,
                    width: 400,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Doğrulama başarılı, devam et
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilPage2()),
                            );
                          }
                        },
                        child: Text(
                          "Devam Et",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 87, 83, 1)),
                        )),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
