import 'package:flutter/material.dart';
import 'package:frontend/constants/text.dart';
import 'package:frontend/pages/credit_cards/add_cards_page.dart';
import 'package:go_router/go_router.dart';

class CardsPage extends StatefulWidget {
  final String? cardName;
  final String? cardNumber;

  const CardsPage({Key? key, this.cardName, this.cardNumber}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
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
          "Ödeme Bilgilerim",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(53, 158, 152, 1.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kayıtlı Kartlarım",
                    style: TextStyle(
                        color: Color.fromRGBO(14, 187, 178, 1), fontSize: 16),
                  ),
                ),
                SizedBox(height: 15),
                _buildInfoRow(cardName, cardNumber),
                SizedBox(height: 15),
                _buildInfoRow(widget.cardName ?? "",
                    widget.cardNumber ?? ""), //null check
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.goNamed("add_cards_page");
                      },
                      child: Image.asset(
                        'assets/credit_icon.png',
                        width: 45,
                        height: 45,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Yeni Kart Ekle",
                      style: TextStyle(
                          color: Color.fromRGBO(22, 34, 33, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Emin misiniz?"),
          content: Text("Kartınızı silmek istediğinize emin misiniz?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Uyarıyı kapat
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                //_deleteCard();
                Navigator.of(context).pop(); // Uyarıyı kapat
              },
              child: Text("Evet, Sil"),
            ),
          ],
        );
      },
    );
  }

  // void _deleteCard() {
  //   setState(() {
  //     // Kartı silmek için gerekli işlemler
  //     widget.cardName = null;
  //     widget.cardNumber = null;
  //   });
  // }

  Column _buildInfoRow(String isim, String cardno) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Satırı baştan sona genişletmek için
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Mastercard_logo.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 10),
                Text(
                  isim,
                  style: TextStyle(color: Color.fromRGBO(22, 34, 33, 1)),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _showDeleteConfirmationDialog(context);
              },
              child: Image.asset(
                'assets/Delete_Button.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        Text(
          cardno,
          style: TextStyle(
              color: Color.fromARGB(255, 127, 125, 125), fontSize: 12),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}
