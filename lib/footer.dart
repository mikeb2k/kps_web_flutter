import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';
import 'constants.dart';

class Footer extends StatefulWidget {
  final int id;
  Footer({Key? key, required this.id}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          widget.id == 2 ? const Spacer() : Container(),
          const SelectableText(
            "© 2023 KPS - priemyselný tovar, s.r.o",
            style: TextStyle(fontSize: 20),
          ),
          TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                  foregroundColor: MaterialStateProperty.resolveWith(((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return KPSColors.colorKPS;
                    }

                    return Colors.black87;
                  })),
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () async {
                launchUrl(Uri.parse(Constants.urlGDPR));
              },
              child: const Text("Politika informačnej bezpečnosti")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Built on Flutter with"),
              Icon(
                EvaIcons.heart,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
