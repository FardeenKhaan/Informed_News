import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController _newscontroller = Get.put(NewsController());
    TextEditingController _searchcontroller = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: _searchcontroller,
            decoration: InputDecoration(
              hintText: 'Search....',
              hintStyle: TextStyle(fontSize: 18),
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
            ),
          )),
          Obx(() => _newscontroller.isLoading.value
              ? Container(
                  padding: EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : InkWell(
                  onTap: () =>
                      _newscontroller.SearchSection(_searchcontroller.text),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
