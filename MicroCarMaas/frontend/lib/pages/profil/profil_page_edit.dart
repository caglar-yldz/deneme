import 'package:flutter/material.dart';
import 'package:frontend/pages/profil/profil_page.dart';
import 'package:go_router/go_router.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  DateTime? _selectedDate;
  final RegExp _tcRegExp = RegExp(r'^\d{11}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateTC(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!_tcRegExp.hasMatch(value)) {
        return "Geçersiz TC Kimlik Numarası";
      }
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length != 10) {
        return "Geçersiz Telefon Numarası";
      }
    }
    return null;
  }

  String? _validateBirthDate(DateTime? value) {
    if (value == null) {
      return "Doğum Tarihi boş olamaz";
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profili Düzenle",
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/notice.png",
              height: kToolbarHeight - 16,
              width: kToolbarHeight - 16,
            ),
          ),
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
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/profile.png",
                      width: 120,
                      height: 120,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Profil Resmini Düzenle",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(80, 85, 92, 1.0),
                        ),
                      ),
                      SizedBox(width: 3), // Araya boşluk ekledik
                      Image.asset(
                        "assets/profile2.png", // Profil resmi dosya yolu
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Ad",
                      hintText: "M*****",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    //validator: _validateName,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Soyad",
                      hintText: "Y****",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    //validator: _validateSurname,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "TC Kimlik Numarası",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "12*****",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    keyboardType: TextInputType.number, // Numara klavyesi
                    validator: _validateTC,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Telefon Numarası",
                      hintText: "05***78",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    keyboardType: TextInputType.phone, // Telefon klavyesi
                    validator: _validatePhoneNumber,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-Posta",
                      hintText: "mahmut@gmail.com",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    keyboardType:
                        TextInputType.emailAddress, // E-posta klavyesi
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => _selectDate(context), // Tarih seçiciyi çağır
                    child: IgnorePointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Doğum Tarihi",
                          hintText: "01.01.0001",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        keyboardType: TextInputType.datetime, // Tarih klavyesi
                        controller: TextEditingController(
                          // Seçilen tarihi göstermek için kontrolör kullanıyoruz
                          text: _selectedDate == null
                              ? ''
                              : '${_selectedDate!.day.toString().padLeft(2, '0')}.${_selectedDate!.month.toString().padLeft(2, '0')}.${_selectedDate!.year.toString()}',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Emin misiniz?"),
                            content: Text(
                                "Hesabınızı silmek istediğinize emin misiniz?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("İptal"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Hesabı silme işlemi
                                  // Navigator.pop ile bir önceki sayfaya dönülebilir
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilPage2()), // oylesine diğer sayfaya yönlendirdim değişecek
                                  );
                                },
                                child: Text("Evet, Sil"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "X Hesabımı Sil",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(223, 232, 38, 3),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        height: 50,
                        width: deviceWidth,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(58, 177, 170, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 15.0,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Kaydet",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))),
                  ),
                  SizedBox(height: 22)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//                          backgroundColor: Color.fromRGBO(58, 177, 170, 1.0),
