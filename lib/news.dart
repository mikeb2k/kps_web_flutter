import 'package:flutter/material.dart';

import 'appbar.dart';

class NewsPage extends StatefulWidget {
  final PageController pageCntrl;
  final int btn;
  NewsPage({Key? key, required this.btn, required this.pageCntrl})
      : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: CustomAppBar(btn: widget.btn, pageCntrl: widget.pageCntrl),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("NewsPage")],
        ),
      ),
    );
  }
}

class News {
  final String title;
  final String message;
  final IconData icon;
  final Color colorWindow;
  final Color colorDate;

  const News(
      {required this.title,
      required this.message,
      required this.icon,
      required this.colorWindow,
      required this.colorDate});
}
