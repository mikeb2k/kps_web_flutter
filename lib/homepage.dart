import 'package:flutter/material.dart';
import 'package:kps_web_flutter/appbar.dart';
import 'package:kps_web_flutter/constants.dart';

class HomePage extends StatefulWidget {
  final PageController pageCntrl;
  final int btn;
  HomePage({Key? key, required this.btn, required this.pageCntrl})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: CustomAppBar(
        btn: widget.btn,
        pageCntrl: widget.pageCntrl,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 1, child: Container()),
              leftCard,
              const SizedBox(width: 50),
              rightCard,
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftCard = Expanded(
    child: Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: constraints.maxWidth,
              child: const Text("Ponuka",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            );
          },
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = Constants.columnLeft[index];
            return item.isEmpty
                ? const Divider(
                    indent: 10,
                    endIndent: 10,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_rounded,
                      color: Colors.green[800],
                    ),
                    title: SelectableText(item),
                  );
          },
          itemCount: Constants.columnLeft.length,
        ),
      ],
    )),
  );

  Widget rightCard = Expanded(
    child: Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: constraints.maxWidth,
              child: const Text("Ponuka",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            );
          },
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = Constants.columnLeft[index];
            return item.isEmpty
                ? const Divider(
                    indent: 10,
                    endIndent: 10,
                  )
                : ListTile(
                    leading: Icon(
                      Icons.check_rounded,
                      color: Colors.green[800],
                    ),
                    title: Text(item),
                  );
          },
          itemCount: Constants.columnLeft.length,
        ),
      ],
    )),
  );
}
