import 'package:animation_demo/main_page.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({
    Key? key,
    required this.foodItem,
    required this.tag,
  }) : super(key: key);
  final int tag;
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
              tag: tag,
              child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/${foodItem.img}",
                    fit: BoxFit.cover,
                  ))),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
                """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."""),
          )
        ],
      ),
    );
  }
}
