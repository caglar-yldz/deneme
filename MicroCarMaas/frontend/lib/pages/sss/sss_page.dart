import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class SssPage extends StatefulWidget {
  const SssPage({Key? key}) : super(key: key);

  @override
  State<SssPage> createState() => _SssPageState();
}

class _SssPageState extends State<SssPage> {
  List soru1 = ["App Nedir?", "cevap1"];
  List soru2 = ["Güvenli Sürüş Puanı Nedir?", "cevap1"];
  List soru3 = ["Merhaba Kampanyası Nedir?", "cevap1"];
  List soru4 = ["Usta Kampanyası Nedir?", "cevap1"];
  List soru5 = ["Nasıl Yakıt Alırım?", "cevap1"];
  List soru6 = ["Çağrı Merkezine Ne Zaman Ulaşabilirim?", "cevap1"];
  List soru7 = ["Kullanımı Nasıl Başlatırım ?", "cevap1"];
  List soru8 = ["Kullanımı Nasıl Sonlandırırım ?", "cevap1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sıkça Sorulan Sorular'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 35),
          child: Column(
            children: [
              Sorular(soru1),
              Sorular(soru2),
              Sorular(soru3),
              Sorular(soru4),
              Sorular(soru5),
              Sorular(soru6),
              Sorular(soru7),
              Sorular(soru8),

            ],
          ),
        ),
      ),
    );
  }

  Sorular(List soru) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ExpansionTileCard(
        expandedColor: Colors.white,
        baseColor: Colors.white,
        elevation: 5,
        initialElevation: 1,
        shadowColor: Colors.black,
        title: Text(
          "${soru[0]}",
          style: const TextStyle(
              color: Colors.black,),
        ),
        children: [
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                for (int i = 1; i < soru.length; i++)
                  ListTile(
                    leading: const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    title: Text("${soru[i]}"),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
