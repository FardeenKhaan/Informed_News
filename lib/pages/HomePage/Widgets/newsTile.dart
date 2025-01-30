import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const Newstile(
      {super.key,
      required this.imageUrl,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
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
                Container(
                  width: 120,
                  height: 120,
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
                          CircleAvatar(
                            radius: 10,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              '${author[0]}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              '$author',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.color,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$title',
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$time',
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
