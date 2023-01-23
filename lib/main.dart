import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kps_web_flutter/aboutUs.dart';
import 'package:kps_web_flutter/backend.dart';
import 'package:kps_web_flutter/contact.dart';
import 'package:kps_web_flutter/homepage.dart';
import 'package:kps_web_flutter/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  prefs.getStringList("news");
  prefs.getInt("numMain");
  prefs.getInt("numPage");
  runApp(const KPSWeb());
}

class KPSWeb extends StatefulWidget {
  const KPSWeb({super.key});

  @override
  State<KPSWeb> createState() => _KPSWebState();
}

class _KPSWebState extends State<KPSWeb> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KPS - priemyselný tovar, s.r.o.',
        scrollBehavior: AppScrollBehavior(),
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            cardTheme: CardTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 75, vertical: 20)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)))),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 30)),
                    foregroundColor: MaterialStateProperty.all(Colors.black54),
                    overlayColor: MaterialStateProperty.all(Colors.black12)))),
        home: Backend());
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class HomePageMain extends StatefulWidget {
  HomePageMain({Key? key}) : super(key: key);

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomePage(btn: 0, pageCntrl: pageController),
        NewsPage(btn: 1, pageCntrl: pageController),
        AboutUs(btn: 2, pageCntrl: pageController),
        Contact(btn: 3, pageCntrl: pageController)
      ],
    );
  }
}
