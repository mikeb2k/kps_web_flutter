import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kps_web_flutter/colors.dart';

class AdminAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  AdminAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<AdminAppBar> createState() => _AdminAppBarState();
}

class _AdminAppBarState extends State<AdminAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KPSColors.colorKPS,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app_rounded))
      ],
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int btn;
  final PageController pageCntrl;
  @override
  final Size preferredSize;

  const CustomAppBar({Key? key, required this.btn, required this.pageCntrl})
      : preferredSize = const Size.fromHeight(kToolbarHeight + 200),
        super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<Widget> children = [];
  String item = "domov";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.btn == 0) {
        item = "domov";
      } else if (widget.btn == 1) {
        item = "spravy";
      } else if (widget.btn == 2) {
        item = "onas";
      } else {
        item = "kontakt";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 200,
      centerTitle: true,
      title: SizedBox(
        height: 500,
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          semanticsLabel: "KPS Logo",
        ),
      ),
      backgroundColor: KPSColors.colorKPS,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: MediaQuery.of(context).size.width < 1000
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  underline: Container(color: Colors.transparent),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  isExpanded: true,
                  style: const TextStyle(fontSize: 20),
                  value: item,
                  items: const [
                    DropdownMenuItem(
                      value: "domov",
                      child: Text("Domov"),
                    ),
                    DropdownMenuItem(
                      value: "spravy",
                      child: Text("Správy"),
                    ),
                    DropdownMenuItem(
                      value: "onas",
                      child: Text("O nás"),
                    ),
                    DropdownMenuItem(
                      value: "kontakt",
                      child: Text("Kontakt"),
                    )
                  ],
                  onChanged: (value) {
                    if (value == "domov") {
                      widget.pageCntrl.jumpToPage(0);
                    } else if (value == "spravy") {
                      widget.pageCntrl.jumpToPage(1);
                    } else if (value == "onas") {
                      widget.pageCntrl.jumpToPage(2);
                    } else {
                      widget.pageCntrl.jumpToPage(3);
                    }
                  },
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          widget.pageCntrl.jumpToPage(0);
                        },
                        child: Text("Domov"),
                        style: ButtonStyle(
                            backgroundColor: widget.btn == 0
                                ? MaterialStateProperty.all(Colors.white)
                                : null)),
                    TextButton(
                        onPressed: () {
                          widget.pageCntrl.jumpToPage(1);
                        },
                        child: Text("Správy"),
                        style: ButtonStyle(
                            backgroundColor: widget.btn == 1
                                ? MaterialStateProperty.all(Colors.white)
                                : null)),
                    TextButton(
                        onPressed: () {
                          widget.pageCntrl.jumpToPage(2);
                        },
                        child: Text("O nás"),
                        style: ButtonStyle(
                            backgroundColor: widget.btn == 2
                                ? MaterialStateProperty.all(Colors.white)
                                : null)),
                    TextButton(
                        onPressed: () {
                          widget.pageCntrl.jumpToPage(3);
                        },
                        child: Text("Kontakt"),
                        style: ButtonStyle(
                            backgroundColor: widget.btn == 3
                                ? MaterialStateProperty.all(Colors.white)
                                : null)),
                  ],
                ),
              ),
      ),
    );
  }
}
