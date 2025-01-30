import 'package:flutter/material.dart';

class Trendingcard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;
  const Trendingcard(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(5),
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 200,
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) {
                          print('Invalid Image URL: $imageUrl');
                          print('Error Details: $error');
                          return Container(
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: SizedBox(
                              height: 30, // Smaller size
                              width: 30, // Smaller size
                              child: CircularProgressIndicator(
                                strokeWidth: 2, // Thinner stroke
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$tag',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      '$time',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
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
                    Flexible(
                        child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        '${author[0]}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        '$author',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.labelSmall?.color,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
