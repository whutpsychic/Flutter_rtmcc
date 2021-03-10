import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int photoIndex = 0;

  List<String> photos = [
    "assets/overview_img1.jpeg",
    "assets/overview_img2.jpeg",
    "assets/overview_img3.jpeg",
    "assets/overview_img4.jpeg",
  ];

  void _previousImage() {
    setState(() {
      photoIndex = (photoIndex > 0 ? photoIndex - 1 : 0);
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex =
          (photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Carousel")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: AssetImage(photos[photoIndex]),
                          // fit: BoxFit.contain,
                        )),
                    // width: 300,
                    height: 400,
                  ),
                  Positioned(
                    top: 375,
                    left: 25,
                    right: 25,
                    child: SelectedPhoto(
                      numberOfDots: photos.length,
                      photoIndex: photoIndex,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("prev", style: TextStyle(color: Colors.white)),
                    onPressed: _previousImage,
                    elevation: 5.0,
                    color: Colors.blue),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                    child: Text("next"),
                    onPressed: _nextImage,
                    elevation: 5.0,
                    color: Colors.green),
              ],
            )
          ],
        ));
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
            padding: EdgeInsets.only(left: 3.0, right: 3.0),
            child: Container(
                width: 5.0,
                height: 5.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4.0)))));
  }

  Widget _activePhoto() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
                width: 100,
                height: 10.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.0,
                          blurRadius: 2.0)
                    ]))));
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDots(),
    ));
  }
}
