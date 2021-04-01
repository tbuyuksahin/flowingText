import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

class BuildPage extends StatelessWidget {
  final String image;
  final String pageNumber;
  final Function voice;

  const BuildPage({this.image, this.pageNumber, this.voice});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: PinchZoomImage(
                image: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Center(child: Image.asset(image, fit: BoxFit.contain)),
                ),
                zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                hideStatusBarWhileZooming: true,
                onZoomStart: () {
                  print('Zoom started');
                },
                onZoomEnd: () {
                  print('Zoom finished');
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 30,
                        child: Center(
                            child: Text(pageNumber,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ))),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
