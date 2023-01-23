import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:kps_web_flutter/appbar.dart';
import 'package:kps_web_flutter/colors.dart';
import 'package:kps_web_flutter/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

import 'constants.dart';

class Backend extends StatefulWidget {
  Backend({Key? key}) : super(key: key);

  @override
  State<Backend> createState() => _BackendState();
}

class _BackendState extends State<Backend> {
  String colorWindow = "red";
  String colorDate = "red";
  String icon = "info";
  late QuillController qcntrl;
  late TextEditingController titleCntrl;
  News news = const News(
      title: "title",
      message: "message",
      icon: Icons.check_box_outline_blank,
      colorWindow: Colors.grey,
      colorDate: Colors.white);

  @override
  void initState() {
    super.initState();
    qcntrl = QuillController.basic();
    titleCntrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    qcntrl.dispose();
    titleCntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Admin Panel",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        const Text(
                          "Počet správ na hlavnej stránke",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(),
                        const SizedBox(height: 20),
                        const Text(
                          "Počet správ na jednu stranu",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Dialog(
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      vertical:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              20),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Vytvoriť správu",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                    const Divider(),
                                                    const Text(
                                                      "Nadpis",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    TextFormField(
                                                        controller: titleCntrl),
                                                    const SizedBox(height: 20),
                                                    const Text(
                                                      "Správa",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black38),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Column(
                                                          children: [
                                                            QuillToolbar.basic(
                                                                controller:
                                                                    qcntrl),
                                                            QuillEditor.basic(
                                                                controller:
                                                                    qcntrl,
                                                                readOnly:
                                                                    false),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Text(
                                                                "Ikona",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              const SizedBox(
                                                                  width: 20),
                                                              DropdownButton(
                                                                value: icon,
                                                                items: Constants
                                                                    .iconList,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    icon =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Text(
                                                                "Farba okna",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              const SizedBox(
                                                                  width: 20),
                                                              DropdownButton(
                                                                value:
                                                                    colorWindow,
                                                                items: KPSColors
                                                                    .colorDropDown,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    colorWindow =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                            child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Text(
                                                              "Farba dátumu",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            DropdownButton(
                                                              value: colorDate,
                                                              items: KPSColors
                                                                  .colorDropDown,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  colorDate =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        OutlinedBtn(
                                                          flex: 2,
                                                          color: Colors.green,
                                                          name: "Uložiť",
                                                          icon: Icons
                                                              .check_rounded,
                                                          onPressed: () {
                                                            setState(() {
                                                              news = News(
                                                                  title:
                                                                      titleCntrl
                                                                          .text,
                                                                  message: convertToHtml(qcntrl
                                                                      .document
                                                                      .toDelta()
                                                                      .toJson()),
                                                                  icon: getIcon(
                                                                      icon),
                                                                  colorWindow: KPSColors
                                                                      .getColor(
                                                                          colorWindow),
                                                                  colorDate: KPSColors
                                                                      .getColor(
                                                                          colorDate));
                                                            });
                                                            qcntrl.clear();
                                                            titleCntrl.clear();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        Flexible(
                                                            flex: 1,
                                                            child: Container()),
                                                        OutlinedBtn(
                                                          flex: 2,
                                                          color: Colors.blue,
                                                          name:
                                                              "Zobraziť správu",
                                                          icon: Icons
                                                              .remove_red_eye_rounded,
                                                          onPressed: () {},
                                                        ),
                                                        Flexible(
                                                            flex: 1,
                                                            child: Container()),
                                                        OutlinedBtn(
                                                          flex: 2,
                                                          color: Colors.red,
                                                          name: "Zrušiť",
                                                          icon: Icons
                                                              .cancel_outlined,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      );
                                    },
                                  ).whenComplete(() {
                                    setState(() {});
                                  });
                                },
                                child: const Text("Nová správa")),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text("Aplikovať nastavenia")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              NewsCard(
                icon: news.icon,
                message: news.message,
                title: news.title,
                colorDate: news.colorDate,
                colorWindow: news.colorWindow,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getNewsList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("news")!;
  }

  // DropdownMenuItem(value: "info", child: Icon(Icons.info_outline_rounded)),
  // DropdownMenuItem(value: "time", child: Icon(Icons.access_time_rounded)),
  // DropdownMenuItem(value: "error", child: Icon(Icons.error_outline_rounded)),

  IconData getIcon(String icon) {
    if (icon == "info") {
      return Icons.info_outline_rounded;
    } else if (icon == "time") {
      return Icons.access_time_rounded;
    } else {
      return Icons.error_outline_rounded;
    }
  }

  convertToHtml(input) {
    final converter = QuillDeltaToHtmlConverter(input);
    final html = converter.convert();
    return html;
  }
}

class NewsCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color colorWindow;
  final Color colorDate;
  final String message;

  NewsCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.colorWindow,
      required this.message,
      required this.colorDate})
      : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Card(
          child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: widget.colorWindow,
              child: LayoutBuilder(
                builder: (p0, p1) {
                  return SizedBox(
                    width: p1.maxWidth,
                    child: Wrap(
                      children: [
                        Icon(widget.icon, color: Colors.white),
                        const SizedBox(width: 20),
                        SelectableText(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              color: widget.colorWindow.withOpacity(0.2),
              child: Column(
                children: [
                  Html(
                    data: widget.message,
                  ),
                  Row(
                    children: const [
                      Spacer(),
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Icon(Icons.delete_outline_rounded)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class OutlinedBtn extends StatefulWidget {
  final int flex;
  final Color color;
  final String name;
  final IconData icon;
  final VoidCallback? onPressed;
  OutlinedBtn(
      {Key? key,
      required this.flex,
      required this.color,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  State<OutlinedBtn> createState() => _OutlinedBtnState();
}

class _OutlinedBtnState extends State<OutlinedBtn> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: widget.flex,
      child: OutlinedButton(
          onHover: (value) {
            setState(() {
              hover = value;
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                ((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return widget.color;
                  }

                  return null;
                }),
              ),
              side: MaterialStateProperty.all(BorderSide(color: widget.color))),
          onPressed: widget.onPressed,
          child: ListTile(
            leading: Icon(
              widget.icon,
              color: hover ? Colors.white : widget.color,
            ),
            title: Text(
              widget.name,
              style: TextStyle(color: hover ? Colors.white : widget.color),
            ),
          )),
    );
  }
}
