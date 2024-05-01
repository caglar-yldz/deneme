import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/appColors.dart';
import 'package:go_router/go_router.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late List<TextEditingController> _otpControllers;
  late Timer _timer;
  int _remainingTime = 120; // 2 dakika (120 saniye)
  dynamic number;

  @override
  void didChangeDependencies() {
    number = ModalRoute.of(context)!.settings.arguments;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(4, (_) => TextEditingController());
    _configureTextFields();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  //dinleyici:bir sonraki boxa geçsin diye.
  void _configureTextFields() {
    for (int i = 0; i < _otpControllers.length; i++) {
      if (i < _otpControllers.length - 1) {
        _otpControllers[i].addListener(() {
          if (_otpControllers[i].text.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        });
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          // Burada timer bittiğinde yapılacak işlemler eklenecek
        }
      });
    });
  }

  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double deviceHeight = mediaQueryData.size.height;

    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: AppColors.loginLinear),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop("login");
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Telefon Doğrulama",
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: 20, //aralık
              ),
              Text(
                  "Lütfen +90 ${number[0]} numaralı \n telefonunuza gönderilen 4 haneli \n doğrulama kodunu giriniz.",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 30, //aralık
              ),
              _buildVerificationCodeInput(),
              Text(
                " $_remainingTime ",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 30),
              Text(
                "Kod almadınız mı?",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tekrardan OTP Kodu Gönder",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  )),
              SizedBox(height: 50),
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
                          context.goNamed("ShellHome");
                        },
                        child: Text(
                          "DEVAM ET",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 87, 83, 1)),
                        ))),
              ),

              // Yazıyı yatay olarak ortala),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationCodeInput() {
    return Container(
      height: 150,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children:
            List.generate(4, (index) => _buildVerificationCodeInputBox(index)),
      ),
    );
  }

  Widget _buildVerificationCodeInputBox(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 210, 208, 208),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          controller: _otpControllers[index],
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
