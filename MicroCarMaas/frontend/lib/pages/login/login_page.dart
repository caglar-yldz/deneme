import 'package:flutter/material.dart';
import 'package:frontend/constants/appColors.dart';
import 'package:frontend/utils/helper_function.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> areaCodes = [
    '+1', // Amerika Birleşik Devletleri
    '+44', // Birleşik Krallık
    '+49', // Almanya
    // Diğer alan kodlarını ekleyebilirsiniz
  ];
  final numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;
    String dropDownValue = "   (+90) Türkiye";

    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: AppColors.loginLinear),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/carLogin.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      "App'e Hoş Geldiniz",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Telefon numaranızla giriş yapın, size 4 haneli doğrulama kodu içeren bir SMS göndereceğiz.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    /*  DropdownButtonFormField(
                      icon: Icon(Icons.arrow_downward_sharp, color: Colors.white),
                      menuMaxHeight: deviceWidth,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 192, 224, 236)),
                      hint: dropDownValue == ""
                          ? const Center(
                              child: Text(
                              'bbbbb',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))
                          : Text(
                              dropDownValue,
                              style: const TextStyle(color: Colors.black54),
                            ),
                      isExpanded: true,
                      iconSize: 25.0,
          
                      //style: TextStyle(color: Colors.blue),
                      items: areaCodes.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            dropDownValue = val!;
                          },
                        );
                        setState(() {});
                      },
                    ),*/
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        controller: numberController,

                        //keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 192, 224, 236),
                          filled: true,
                          hintText: "   Telefon Numarası Giriniz",
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
                          suffixIcon: Icon(Icons.phone),
                          suffixIconColor: Colors.white,
                        ),
                        validator: (value) {
                          validatePhoneNumber(
                              phoneNumber: numberController.text);
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                          height: 60,
                          width: deviceWidth,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 15.0,
                              ),
                              onPressed: () {
                                _login();
                              },
                              child: Text(
                                "KOD GÖNDER",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 41, 164, 164)),
                              ))),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  void _login() {
    print("object");

    if (_formKey.currentState!.validate()) {
      print("object");
      print("object");
      context.goNamed("Otp");

      /* Navigator.pushNamedAndRemoveUntil(context, "otp", (route) => true,
          arguments: [numberController.text]);
      /*final number = numberController.text.trim();
      final response =
          await Provider.of<AppDataProvider>(context, listen: false)
              .login(Login(phoneNumber: number));
      if (response != null) {
        showMsg(context, response.message);
        //Navigator.pop(context);
      } else {
        showMsg(context, 'Login failed');
      }*/
    } else {
      showMsg(context, "msg");
    }
  */
    }
  }
}
