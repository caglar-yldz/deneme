import 'package:flutter/material.dart';
import 'package:frontend/constants/text.dart';
import 'package:go_router/go_router.dart';

class ProfilPage2 extends StatefulWidget {
  const ProfilPage2({Key? key}) : super(key: key);

  @override
  State<ProfilPage2> createState() => _ProfilPage2State();
}

class _ProfilPage2State extends State<ProfilPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 158, 152, 1.0),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                  context.goNamed("menu");
              },
              icon: Icon(Icons.menu_sharp))
        ],
      ),
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
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/profile.png",
                          width: 130, // Genişlik
                          height: 130, // Yükseklik
                        ),
                        Positioned(
                          bottom: -15,
                          right: -5,
                          child: IconButton(
                            iconSize: 30,
                            icon: Image.asset(
                              "assets/profile2.png",
                              width: 43,
                              height: 43,
                            ),
                            onPressed: () {
                              // Kalem ikonuna tıklandığında yapılacak işlemler
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Score box
                  _buildScoreBox(),
                  SizedBox(height: 30),
                  _buildInfoRow("Adı ve Soyadı", adiSoyadi),
                  SizedBox(height: 5),
                  _buildInfoRow("Telefon Numarası", telefon),
                  SizedBox(height: 5),
                  _buildInfoRow("Email", email),
                  SizedBox(height: 5),
                  _buildInfoRow("TC Kimlik Numarası", tc),
                  SizedBox(height: 5),
                  _buildInfoRow("Doğum Tarihi", dogumTarihi),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildScoreBox() {
    return Container(
      height: 25,
      width: 175,
      decoration: BoxDecoration(
        color: Color.fromRGBO(53, 158, 152, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Sürüş Puanı   "
                "$puan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Image.asset("assets/award.png"),
          ),
        ],
      ),
    );
  }

  Column _buildInfoRow(String labelText, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: Color.fromRGBO(14, 187, 178, 1)),
        ),
        SizedBox(height: 15),
        Text(
          data,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Divider()
      ],
    );
  }
}
