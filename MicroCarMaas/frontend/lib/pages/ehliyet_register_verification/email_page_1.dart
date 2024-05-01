import 'package:flutter/material.dart';
import 'driver_page.dart';

class EmailPage1 extends StatefulWidget {
  const EmailPage1({Key? key});

  @override
  State<EmailPage1> createState() => _EmailPage1State();
}

class _EmailPage1State extends State<EmailPage1> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                  Text(
                    "E-Posta Adresini Doğrulamalısın",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(223, 14, 156, 111),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 45),
                  Text(
                    "Yapacağın kiralamalara ait fatura ve sözleşmelerin sana ulaştığından emin olabilmemiz için, gireceğin e-posta adresini doğrulamamız gerekiyor.E-posta adresinin doğruluğundan eminsen devam etmek için butona tıkla.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(223, 31, 124, 95)),
                  ),
                  SizedBox(height: 63),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 199, 228, 231),
                      filled: true,
                      hintText: "   E Posta Adresin",
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
                        return "E-posta adresi boş olamaz";
                      }
                      if (!isValidEmail(value)) {
                        return "Geçerli bir e-posta adresi giriniz";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Container(
                    height: 60,
                    width: 360,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form doğrulandı, uyarı kutusunu göster
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                width: 400,
                                height: 290,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 244, 244),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\n\nDoğrulama linkini e-posta adresine gönderdik. Lütfen posta kutunu kontrol et.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(242, 9, 0, 0),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    ElevatedButton(
                                      //onPressed: () => Navigator.pop(context),
                                      onPressed: () {
                                        // Doğrulama başarılı, devam et
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DriverPage()),
                                        );
                                      },
                                      child: Text(
                                        'TAMAM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 40, 142, 131),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Doğrulama Linki Gönder",
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(0, 87, 83, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    String emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
