import 'package:flutter/material.dart';
import 'package:frontend/constants/text.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
          "Menu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 158, 152, 1.0),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              _button(profiliDuzenle),
              _button(surusGecmisim),
              _button(odemeBilgilerim),
              _button(ehliyetBilgilerim),
              _button(destek),
              _button(sikSorulanSorular),
              _button(sozlesmeler),
              TextButton(
                style: ButtonStyle(animationDuration: Duration.zero),
                onPressed: () {
                  context.goNamed("Login");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Çıkış Yap",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/menuLogOut.png",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _button(List name) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.goNamed(name[2]);
          },
          child: Container(
            height: 50,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/bosArka.png",
                    ),
                    Image.asset(name[1]),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 52,
          height: 0.5,
          color: Colors.grey.shade200,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
