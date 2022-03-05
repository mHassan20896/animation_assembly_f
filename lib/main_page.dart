import 'package:animation_demo/detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<FoodItem>>(
        future: _fetchFoodItems(),
        initialData: const [],
        builder: ((context, snapshot) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: Lottie.asset("assets/loader.json"),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.length * 15,
              itemBuilder: (context, i) => Hero(
                tag: i,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedPage(
                              foodItem: snapshot.data![i % 3], tag: i),
                        ),
                      );
                    },
                    child: FoodItemWidget(foodItem: snapshot.data![i % 3])),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<List<FoodItem>> _fetchFoodItems() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return Future.value([
      FoodItem(img: 'pizza.jpeg', name: 'Pizza'),
      FoodItem(img: 'donouts.jpeg', name: 'Donouts'),
      FoodItem(img: 'dessert.jpeg', name: 'Dessert')
    ]);
  }
}

class FoodItem {
  final String img;
  final String name;

  FoodItem({required this.img, required this.name});
}

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: 0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInQuint,
        builder: (context, tweenValue, child) {
          return Padding(
            padding: EdgeInsets.all(25.0 * tweenValue),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/${foodItem.img}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  foodItem.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          );
        });
  }
}
