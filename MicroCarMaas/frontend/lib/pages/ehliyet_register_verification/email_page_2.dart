import 'package:flutter/material.dart';

class EmailPage2 extends StatefulWidget {
  const EmailPage2({super.key});

  @override
  State<EmailPage2> createState() => _EmailPage2State();
}

class _EmailPage2State extends State<EmailPage2> {
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
                SizedBox(height: 25),
                Container(
                  width: 400,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 161, 209, 204),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\n\nDoğrulama linkini e-posta adresine gönderdik. Lütfen posta kutunu kontrol et.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          color: Color.fromARGB(202, 83, 82, 82),
                        ),
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'TAMAM',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 62, 187, 175),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 85),
                Container(
                  height: 60,
                  width: 400,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Doğrulama Linki Gönder",
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(0, 87, 83, 1)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
