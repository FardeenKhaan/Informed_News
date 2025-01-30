import 'package:flutter/material.dart';
import 'package:getx_news_app/Shimmer_container.dart';

class TrendingLdgcard extends StatelessWidget {
  const TrendingLdgcard({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(5),
        width: widthDevice * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.all(3.0),
                child: ShimmerLoadingContainer(
                    width: widthDevice * 0.55, height: heightDevice * 0.27)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerLoadingContainer(
                      width: widthDevice * 0.25, height: heightDevice * 0.04),
                  ShimmerLoadingContainer(
                      width: widthDevice * 0.25, height: heightDevice * 0.04),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerLoadingContainer(
                      width: widthDevice * 0.5, height: heightDevice * 0.042),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  ShimmerLoadingContainer(
                      width: widthDevice * 0.073, height: heightDevice * 0.06),
                  SizedBox(
                    width: 5,
                  ),
                  ShimmerLoadingContainer(
                      width: widthDevice * 0.4, height: heightDevice * 0.042),
                ],
              ),
            )
          ],
        ));
  }
}
