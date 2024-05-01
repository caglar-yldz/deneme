import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class DestekPage extends StatefulWidget {
  const DestekPage({Key? key}) : super(key: key);

  @override
  State<DestekPage> createState() => _DestekPageState();
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'beyzanurodabas555@gmail.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Example Subject & Symbols are allowed!',
  }),
);

class _DestekPageState extends State<DestekPage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Destek",
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
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _buildInfoRow(
                    "Bize Mesaj At !",
                    "Bizimle uygulama içinden mesajlaşabilirsin.",
                    "assets/Conversation.png"),
                _buildInfoRow(
                    "Mail Gönder",
                    "Sorularını ve problemlerini mail yoluyla ilet.",
                    "assets/Mail.png"),
                _buildInfoRow(
                    "Müşteri Hizmetleri", "05301375543", "assets/Call.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildInfoRow(String message, String text, String asset) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (message == "Mail Gönder") {
              print("aaa");
              //_launchPhone(); // Telefon aramasını başlat
              //_launchEmail(); // E-posta gönderimini başlat
              //launchUrl(emailLaunchUri);
              //_launchUrl();
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/destek-oval.png',
                    width: 44,
                    height: 44,
                  ),
                  Positioned(
                    left: 6,
                    child: Image.asset(
                      asset,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: Color.fromRGBO(22, 34, 33, 1), fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      text,
                      style: TextStyle(
                          color: Color.fromARGB(255, 127, 125, 125),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }

  // // Telefon numarasını arama işlevi
  // _launchPhone() async {
  //   const phoneNumber = 'tel:+1800806';
  //   if (await canLaunch(phoneNumber)) {
  //     await launch(phoneNumber);
  //   } else {
  //     throw 'Telefon arama işlevi başlatılamadı: $phoneNumber';
  //   }
  // }
  // _launchEmail() async {
  //   if (await canLaunch(emailLaunchUri.toString())) {
  //     await launch(emailLaunchUri.toString());
  //   } else {
  //     throw 'E-posta başlatılamadı: $emailLaunchUri';
  //   }
  // }
  /*Future<void> _launchUrl() async {
    try {
      if (!await launchUrl(emailLaunchUri)) {
        throw Exception('Could not launch $emailLaunchUri');
      }
    } catch (e) {
      print('Hata: $e');
    }
  }*/
}
