import 'package:flutter/material.dart';
import 'package:go_router/src/route.dart';
import 'package:intl/intl.dart';
import 'email_page_1.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required StatefulNavigationShell navigationShell});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? _selectedDate;
  final RegExp _tcRegExp = RegExp(r'^\d{11}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Ad boş bırakılamaz";
    }
    return null;
  }

  String? _validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return "Soyad boş bırakılamaz";
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

  String? _validateBirthDate(DateTime? value) {
    if (value == null) {
      return "Doğum Tarihi boş olamaz";
    }
    return null;
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
                    "Hesap Bilgilerini Tamamla",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(223, 14, 156, 111)),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: "   Adınızı Giriniz",
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
                    validator: _validateName,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: "   Soy Adınızı Giriniz",
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
                    validator: _validateSurname,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: "   TC Kimlik Numaranızı Giriniz",
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
                    height: 40,
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
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 192, 224, 236),
                      filled: true,
                      hintText: _selectedDate == null
                          ? "   Doğum Tarihinizi Seçiniz"
                          : "   ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}",
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
                    validator: (_) => _validateBirthDate(_selectedDate),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    height: 60,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Doğrulama başarılı, devam et
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailPage1()),
                          );
                        }
                      },
                      child: Text(
                        "DEVAM ET",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(4, 136, 129, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
