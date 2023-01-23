import 'package:flutter/material.dart';
import 'package:kps_web_flutter/footer.dart';
import 'package:webviewx/webviewx.dart';
import 'appbar.dart';

class AboutUs extends StatefulWidget {
  final PageController pageCntrl;
  final int btn;
  AboutUs({Key? key, required this.btn, required this.pageCntrl})
      : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    super.dispose();
    webviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: CustomAppBar(
        btn: widget.btn,
        pageCntrl: widget.pageCntrl,
      ),
      body: Stack(
        children: [
          Footer(id: 2),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  WebViewX(
                    width: 800,
                    height: 600,
                    onWebViewCreated: (controller) {
                      webviewController = controller;
                      webviewController.loadContent(
                          "https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d42221.80714336262!2d17.758529!3d48.593323!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6299a7824b563ec0!2sKPS%20-%20priemyseln%C3%BD%20tovar%2C%20s.r.o.!5e0!3m2!1sen!2sus!4v1614808582117!5m2!1sen!2sus",
                          SourceType.url);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
