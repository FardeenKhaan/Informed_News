import 'package:flutter/material.dart';
import 'package:getx_news_app/Shimmer_container.dart';

class Newstileldgcard extends StatelessWidget {
  const Newstileldgcard({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              ShimmerLoadingContainer(
                  width: widthDevice * 0.2, height: heightDevice * 0.15),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        ShimmerLoadingContainer(
                            width: widthDevice * 0.073,
                            height: heightDevice * 0.06),
                        SizedBox(
                          width: 5,
                        ),
                        ShimmerLoadingContainer(
                            width: widthDevice * 0.4,
                            height: heightDevice * 0.042),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ShimmerLoadingContainer(
                        width: widthDevice * 0.7, height: heightDevice * 0.04),
                    SizedBox(
                      height: 8,
                    ),
                    ShimmerLoadingContainer(
                        width: widthDevice * 0.7, height: heightDevice * 0.04),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
