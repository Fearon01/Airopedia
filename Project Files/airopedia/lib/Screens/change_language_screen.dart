import 'package:airopedia/Widgets/navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class LanguageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageScreenState();
}

class Language 
{
  String name;
  String languageCode;
  String languageImage;
  double languageImageOpacity;

  Language({required this.name, required this.languageCode, required this.languageImage, required this.languageImageOpacity});

  String get language {
    return name;
  }

  set setName(String languageName) {
    name = languageName;
  }

  String get code 
  {
    return languageCode;
  }

  set setCode(String code) {
    languageCode = code;
  }

  String get image
  {
    return languageImage;
  }
  

  double get imageOpacity 
  {
    return languageImageOpacity;
  }

  set setOpacity(double opacity) 
  {
    languageImageOpacity = opacity;
  }


}

class LanguageScreenState extends State<LanguageScreen> {
  
  late String languagePref;
  
  static List<Language> languages = [Language(name: "German", languageCode: "de", languageImage: "assets/images/GermanFlag.png" , languageImageOpacity: 0.50), Language(name: "English", languageCode: "en_GB", languageImage: "assets/images/GBFlag.png" , languageImageOpacity: 0.50), Language(name: "Spanish", languageCode: "es", languageImage: "assets/images/SpainFlag.png", languageImageOpacity: 0.50), Language(name: "French", languageCode: "fr", languageImage: "assets/images/FrenchFlag.png", languageImageOpacity: 0.50), Language(name: "Greek", languageCode: "el", languageImage: "assets/images/GreekFlag.png", languageImageOpacity: 0.50), Language(name: "Italian", languageCode: "it", languageImage: "assets/images/ItalianFlag.png", languageImageOpacity: 0.50), Language(name: "Polish", languageCode: "pl", languageImage: "assets/images/PolishFlag.png", languageImageOpacity: 0.50), Language(name: "Portuegese", languageCode: "pt", languageImage: "assets/images/PortugueseFlag.png", languageImageOpacity: 0.50), Language(name: "Russian", languageCode: "ru", languageImage: "assets/images/RussianFlag.png", languageImageOpacity: 0.50)];
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    GetLanguage().whenComplete(() {setState(() {
      
    });});
  }

  Future<void> GetLanguage() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    languagePref = preferences.getString('lang')!;

    languages.forEach((element) { 
      if (element.code == languagePref) 
      {
        element.languageImageOpacity = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xff0d67b5),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(top: 100.0),
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Languages',
                style: TextStyle(
                  fontFamily: 'HVD_Comic_Serif_Pro',
                  fontSize: 42,
                  color: Color(0xfff7f3e8),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0
              ),
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: 100.0,
                    height: 105.0,
                    child: Column(children: [
                      Opacity(
                        opacity: languages[index].imageOpacity,
                        child: IconButton(
                          onPressed: () async {
                            if (languagePref == languages[index].languageCode) 
                            {
                              return;
                            }

                            int currentLang = languages.indexWhere((element) => element.languageCode == languagePref);
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.setString('lang', languages[index].languageCode);
                            languagePref = languages[index].languageCode;
                            setState(() {
                              languages[currentLang].languageImageOpacity = 0.50;
                              languages[index].languageImageOpacity = 1.0;
                            });
                          },
                          icon: Image.asset(languages[index].languageImage),
                          iconSize: 85.0,
                        ),
                      ),
                      Text(languages[index].name,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Color(0xfff7f3e8)))
                    ]));
              },
              
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          items: buttons,
          index: pageIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          onTap: (int index) {
            if (index == 4) {
              if (route.length == 1) {
                Navigator.pop(
                    context);
                    
                route.Pop();
                return;
              } else if (route.length < 1) {
                Navigator.pop(
                    context);
                    return; 
              }

              screens.last = route.Peek;
              Navigator.pop(context);
            } else {
              route.Push(screens[index]!);
            }

            pageIndex = index;
            Navigator.pop(
                context);
          },
        )
      );
}
