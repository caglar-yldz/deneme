import 'package:flutter/material.dart';
import 'package:frontend/constants/text.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  // Gizlilik politikası metinlerini tutacak sözlük
  final Map<String, String> privacyPolicy = {
    "1 Sözleşme,":
        "   Uygulamanın sunduğu bir araç paylaşım hizmeti gizlilik sözleşmesidir, ancak kendi başına hiçbir aracın kullanımı için herhangi bir hak vermez. Bir Üye, araçları yalnızca müsaitlik durumuna göre, sözleşme'nin hükümlerine uygun olarak ve ilgili tüm ücret ve bedelleri ödemek kaydıyla kullanabilir. ",
    "2 Otokar,":
        "   Otokar, tüm Otokar araçlarının, mobil uygulamasının ve gizlilik sözleşmesinin süresi boyunca Üye'ye sağladığı veya Üye'nin kullanımına sunduğu her ürünün ve bu ürünlerin tüm eklentilerinin sahibidir.",
    "3 Üyeler":
    "   Üyelerin rezervasyonları sırasında kullanımlarına ilişkin araç verileri (GPS, ortalama hız, yakıt doluluk oranı, çeşitli parametrelerde sürüş analizleri v.b.) Otokar tarafından hizmetin sunulabilmesi için izlenebilir, depolanabilir ve gerektiğinde kullanılabilir. Üye bu verilerin Otokar tarafından kullanılabileceğini peşinen kabul eder."
  };

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
          "Gizlilik Politikası",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(53, 158, 152, 1.0)),
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
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: privacyPolicy.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                            color: Color.fromRGBO(1, 5, 5, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        entry.value,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
