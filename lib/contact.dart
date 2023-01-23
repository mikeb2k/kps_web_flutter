import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kps_web_flutter/colors.dart';
import 'package:kps_web_flutter/footer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appbar.dart';

class Contact extends StatefulWidget {
  final PageController pageCntrl;
  final int btn;
  Contact({Key? key, required this.btn, required this.pageCntrl})
      : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: CustomAppBar(btn: widget.btn, pageCntrl: widget.pageCntrl),
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width < 1400 ? 0 : 50),
          child: MediaQuery.of(context).size.width < 1400
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UnifiedCard(id: 0, flex: 1),
                      UnifiedCard(id: 1, flex: 1),
                      UnifiedCard(id: 2, flex: 1),
                      ContactLeftCard(flex: 1),
                      SocialNetworksCard(flex: 1, social: "fb"),
                      SocialNetworksCard(flex: 1, social: "ig"),
                      SocialNetworksCard(flex: 1, social: "wh"),
                      SocialNetworksCard(flex: 1, social: "tg"),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Flexible(flex: 2, child: Container()),
                        UnifiedCard(id: 0, flex: 3),
                        UnifiedCard(id: 1, flex: 3),
                        UnifiedCard(id: 2, flex: 3),
                        Flexible(flex: 2, child: Container()),
                      ],
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(flex: 2, child: Container()),
                          ContactLeftCard(flex: 3),
                          Flexible(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SocialNetworksCard(flex: 5, social: "fb"),
                                SocialNetworksCard(flex: 5, social: "ig"),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SocialNetworksCard(flex: 5, social: "wh"),
                                SocialNetworksCard(flex: 5, social: "tg"),
                              ],
                            ),
                          ),
                          Flexible(flex: 2, child: Container()),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Footer(
                      id: 3,
                    )
                  ],
                ),
        ));
  }

  Widget card = Flexible(
    flex: 2,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.map_rounded),
              title: SelectableText("Adresa"),
            ),
            const Divider(),
            const SelectableText("Štúrova 263/19"),
            const SelectableText("922 10 Trebatice"),
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero))),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 16)),
                    foregroundColor:
                        MaterialStateProperty.resolveWith(((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.red[900];
                      }

                      return Colors.redAccent[400];
                    })),
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () async {
                  launchUrl(
                      Uri.parse("https://g.page/zeleziarstvotrebatice?share"));
                },
                child: Row(
                  children: const [
                    Icon(Icons.location_pin),
                    Text("Zobraziť na mape")
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}

class UnifiedCard extends StatefulWidget {
  final int id;
  final int flex;

  UnifiedCard({Key? key, required this.id, required this.flex})
      : super(key: key);

  @override
  State<UnifiedCard> createState() => _UnifiedCardState();
}

class _UnifiedCardState extends State<UnifiedCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: widget.flex,
        child: GestureDetector(
          onTap: () async {
            launchUrl(Uri.parse(widget.id == 0
                ? "https://g.page/zeleziarstvotrebatice?share"
                : widget.id == 1
                    ? "mailto:kps-trebatice@t-network.sk"
                    : "tel:+421905361241"));
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => setState(() {
              hover = true;
            }),
            onExit: (event) => setState(() {
              hover = false;
            }),
            child: Card(
              color: hover
                  ? widget.id == 0
                      ? Colors.green[400]
                      : widget.id == 1
                          ? Colors.red[400]
                          : widget.id == 2
                              ? Colors.blue[400]
                              : null
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.id == 0
                          ? Icons.map_rounded
                          : widget.id == 1
                              ? Icons.mail_rounded
                              : Icons.phone_in_talk_rounded,
                      size: 40,
                      color: hover ? Colors.white : Colors.black,
                    ),
                    Divider(
                      color: hover ? Colors.white : null,
                    ),
                    Text(
                      widget.id == 0
                          ? "Navštívte nás!"
                          : widget.id == 1
                              ? "Napíšte nám!"
                              : "Zavolajte nám!",
                      style: TextStyle(
                        fontSize: 30,
                        color: hover ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SelectableText(
                      widget.id == 0
                          ? "Štúrova 263/19, Trebatice"
                          : widget.id == 1
                              ? "kps-trebatice@t-network.sk"
                              : "+421 905 361 241",
                      style: TextStyle(
                          color: hover ? Colors.white : Colors.black,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ContactLeftCard extends StatefulWidget {
  final int flex;
  ContactLeftCard({Key? key, required this.flex}) : super(key: key);

  @override
  State<ContactLeftCard> createState() => _ContactLeftCardState();
}

class _ContactLeftCardState extends State<ContactLeftCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: widget.flex,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SelectableText.rich(TextSpan(children: [
                TextSpan(
                    text: "KPS - priemyselný tovar, s.r.o.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                TextSpan(text: "\n"),
                TextSpan(text: "Štúrova 263/19"),
                TextSpan(text: "\n"),
                TextSpan(text: "Trebatice 922 10"),
                TextSpan(text: "\n"),
                TextSpan(text: "Slovenská republika"),
              ], style: TextStyle(fontSize: 18))),
              const Divider(),
              const SelectableText.rich(TextSpan(children: [
                TextSpan(text: "IČO: 36658243"),
                TextSpan(text: "\n"),
                TextSpan(text: "DIČ: 2022225931"),
                TextSpan(text: "\n"),
                TextSpan(text: "IČ DPH: SK2022225931"),
              ], style: TextStyle(fontSize: 18))),
              const Divider(),
              const Text(
                "Otváracie hodiny",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Visibility(
                visible:
                    MediaQuery.of(context).size.width > 1400 ? true : false,
                child: Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.2),
                    1: FractionColumnWidth(0.2),
                    2: FractionColumnWidth(0.1),
                    3: FractionColumnWidth(0.1),
                    4: FractionColumnWidth(0.1),
                    5: FractionColumnWidth(0.1),
                    6: FractionColumnWidth(0.1),
                  },
                  children: const [
                    TableRow(
                      children: [
                        SelectableText(
                          "Pondelok",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "Zatvorené",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText(""),
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Utorok",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "08:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "12:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "13:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText("-"),
                        SelectableText(
                          "16:30",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Streda",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "08:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "12:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "13:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "16:30",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Štvrtok",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "08:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "12:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "13:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "16:30",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Piatok",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "08:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "12:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "13:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "16:30",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Sobota",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "08:00",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "-",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(
                          "12:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText("")
                      ],
                    ),
                    TableRow(
                      children: [
                        SelectableText(
                          "Nedeľa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(
                          "Zatvorené",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText(""),
                        SelectableText("")
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible:
                    MediaQuery.of(context).size.width > 1400 ? false : true,
                child: SelectableText.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "Pondelok: Zatvorené",
                        style: TextStyle(
                            color: Colors.red[600],
                            fontWeight: FontWeight.bold)),
                    const TextSpan(text: "\n"),
                    const TextSpan(
                        text: "Utorok:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: " 08:00 - 12:30 13:00 - 16:30",
                    ),
                    const TextSpan(
                      text: "\n",
                    ),
                    const TextSpan(
                        text: "Streda:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: " 08:00 - 12:30 13:00 - 16:30",
                    ),
                    const TextSpan(
                      text: "\n",
                    ),
                    const TextSpan(
                        text: "Štvrtok:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: " 08:00 - 12:30 13:00 - 16:30",
                    ),
                    const TextSpan(
                      text: "\n",
                    ),
                    const TextSpan(
                        text: "Piatok:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: " 08:00 - 12:30 13:00 - 16:30",
                    ),
                    const TextSpan(
                      text: "\n",
                    ),
                    const TextSpan(
                        text: "Sobota:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: " 08:00 - 12:30 13:00 - 16:30",
                    ),
                    const TextSpan(text: "\n"),
                    TextSpan(
                        text: "Nedeľa: Zatvorené",
                        style: TextStyle(
                            color: Colors.red[600],
                            fontWeight: FontWeight.bold))
                  ], style: const TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        )));
  }
}

class SocialNetworksCard extends StatefulWidget {
  final int flex;
  final String social;
  SocialNetworksCard({Key? key, required this.flex, required this.social})
      : super(key: key);

  @override
  State<SocialNetworksCard> createState() => _SocialNetworksCardState();
}

// FB
// IG
// TG
// WH
class _SocialNetworksCardState extends State<SocialNetworksCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: widget.flex,
        child: GestureDetector(
          onTap: () async {
            launchUrl(Uri.parse(
              widget.social == "fb"
                  ? "https://www.facebook.com/zeleziarstvotrebatice"
                  : widget.social == "ig"
                      ? "https://www.instagram.com/kps_trebatice/"
                      : widget.social == "wh"
                          ? "https://wa.me/421905361241"
                          : "https://t.me/kpstrebatice",
            ));
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => setState(() {
              hover = true;
            }),
            onExit: (event) => setState(() {
              hover = false;
            }),
            child: Card(
                color: hover
                    ? widget.social == "fb"
                        ? KPSColors.colorFB
                        : widget.social == "ig"
                            ? KPSColors.colorIG
                            : widget.social == "wh"
                                ? KPSColors.colorWH
                                : KPSColors.colorTG
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            widget.social == "fb"
                                ? FontAwesomeIcons.facebookF
                                : widget.social == "ig"
                                    ? FontAwesomeIcons.instagram
                                    : widget.social == "wh"
                                        ? FontAwesomeIcons.whatsapp
                                        : FontAwesomeIcons.telegram,
                            size: 30,
                            color: hover
                                ? Colors.white
                                : widget.social == "fb"
                                    ? KPSColors.colorFB
                                    : widget.social == "ig"
                                        ? KPSColors.colorIG
                                        : widget.social == "wh"
                                            ? KPSColors.colorWH
                                            : KPSColors.colorTG,
                          ),
                          Text(
                            widget.social == "fb"
                                ? "  Facebook"
                                : widget.social == "ig"
                                    ? "  Instagram"
                                    : widget.social == "wh"
                                        ? "  WhatsApp"
                                        : " Telegram",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: hover ? Colors.white : null),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SelectableText(
                        widget.social == "fb"
                            ? "@zeleziarstvotrebatice"
                            : widget.social == "ig"
                                ? "@kps_trebatice"
                                : widget.social == "wh"
                                    ? "+421 905 361 241"
                                    : "@kpstrebatice",
                        style: TextStyle(
                            color: hover ? Colors.white : null, fontSize: 18),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
