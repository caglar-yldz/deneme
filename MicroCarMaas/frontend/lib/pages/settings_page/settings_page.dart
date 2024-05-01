import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _updatesEnabled = true;
  bool _darkModeEnabled = false;
  String? _selectedLanguage = 'Türkçe';
  String? _selectedRegion = 'Türkiye';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Ayarlar",
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
        body: ListView(
          children: <Widget>[
            _buildSectionTile(Icon(Icons.security, color: Color.fromRGBO(53, 158, 152, 1.0)), 'Hesap', [
              ListTile(
                title: Text('Gizlilik Politikası', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                onTap: () {
                  // Gizlilik politikası sayfasına git
                },
              ),
            ]),
            _buildSectionTile(Icon(Icons.notifications, color: Color.fromRGBO(53, 158, 152, 1.0)), 'Bildirimler', [
              SwitchListTile(
                title: Text('Bildirimler',style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                subtitle: Text('Bildirimleri aç veya kapat', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0)),),
                value: _notificationsEnabled,
                activeColor: Colors.white,
                activeTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Güncellemeler', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                subtitle: Text('Uygulama güncellemelerini aç veya kapat', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0)),),
                value: _updatesEnabled,
                activeColor: Colors.white,
                activeTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                onChanged: (bool value) {
                  setState(() {
                    _updatesEnabled = value;
                  });
                },
              ),
            ]),
            _buildSectionTile(Icon(Icons.settings, color: Color.fromRGBO(53, 158, 152, 1.0)), 'Diğer', [
              SwitchListTile(
                title: Text('Koyu Mod', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                subtitle: Text('Koyu modu aç veya kapat', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0)),),
                value: _darkModeEnabled,
                activeColor: Colors.white,
                activeTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Color.fromRGBO(53, 158, 152, 1.0),
                onChanged: (bool value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dil', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: _selectedLanguage,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLanguage = newValue;
                        });
                      },
                      items: <String>['Türkçe', 'English', 'Español', 'Français']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ülke/Bölge', style: TextStyle(color: Color.fromRGBO(117, 117, 117, 1.0), fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
                      value: _selectedRegion,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRegion = newValue;
                        });
                      },
                      items: <String>['Türkiye', 'United States', 'United Kingdom', 'Germany']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTile(Widget leading, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: leading,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(53, 158, 152, 1.0),
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
