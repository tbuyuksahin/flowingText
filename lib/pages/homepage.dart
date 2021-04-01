import 'package:flowing_text/styles/appbar_style.dart';
import 'package:flowing_text/widgets/appbutton.dart';
import 'package:flowing_text/widgets/pages.dart';
import 'package:flowing_text/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _pageNumbers;
  List<String> _pageImages;

  PageController _scrollController = PageController();
  bool scroll = false;
  int speedFactor = 100;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      return _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 40),
        curve: Curves.easeOut,
      );
    });
    _pageNumbers = [
      "1",
      "2",
      "3",
      "4",
    ];
    _pageNumbers.first;
    _pageImages = [
      "1.png",
      "2.png",
      "3.png",
      "4.png",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarStyle.textStyleTittle(
            [_showDialogButton()], "Sherlock Holmes"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            child: Icon(Icons.not_started_outlined, color: Colors.black),
            onPressed: () {
              _toggleScrolling();
            }),
        body: Column(children: <Widget>[_createListView()]),
      ),
    );
  }

  Widget _createListView() {
    return Expanded(
      child: PageView.builder(
        itemCount: _pageNumbers.length,
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BuildPage(
              pageNumber: "${_pageNumbers[index]} / ${_pageNumbers.length}",
              image: "assets/${_pageImages[index]}");
        },
      ),
    );
  }

  Widget _showDialogButton() {
    return AppShowDialog(
      title: "Kaydırma Hız Ayarı",
      widget: [
        AppButton(title: "yavaş", speedFactor: 50),
        AppButton(title: "2 Kat Hızlı", speedFactor: 200),
        AppButton(title: "4 Kat Hızlı", speedFactor: 400),
        AppButton(title: "6 Kat Hızlı", speedFactor: 600),
      ],
    );
  }

  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.easeOut);
  }

  _toggleScrolling() {
    setState(() {
      scroll = !scroll;
    });
    if (scroll) {
      _scrollController.animateTo(_scrollController.offset,
          duration: Duration(seconds: 1), curve: Curves.easeOut);
    } else {
      _scroll();
    }
  }
}
