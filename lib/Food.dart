import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTitle(context),
          SizedBox(
            height: 10,
          ),
          Text("Find out what cooking today!"),
          SizedBox(
            height: 10,
          ),
          buildGrid(context),
          Text.rich(
            TextSpan(
                text: "Places",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
              text: "Today' Secial",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(children: [Icon(Icons.add_shopping_cart), Text("Cart")]),
        )
      ],
    );
  }
}

buildGrid(BuildContext context) {
  List<String> list = [
    "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1583417319070-4a69db38a482?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ];
  return Expanded(
      child: GridView.count(
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    crossAxisCount: 3,
    children: [
      ...list.map((e) {
        return Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(e),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        );
      })
    ],
  ));
}
