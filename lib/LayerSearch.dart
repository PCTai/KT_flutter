import 'package:flutter/material.dart';

class LayerSearch extends StatefulWidget {
  LayerSearch({super.key});

  @override
  State<LayerSearch> createState() => _LayerSearchState();
}

class _LayerSearchState extends State<LayerSearch> {
  final List<String> list = [
    "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1583417319070-4a69db38a482?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ];

  bool typeListImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildTitle(context),
          SizedBox(
            height: 20,
          ),
          buildWelcome(context),
          SizedBox(
            height: 10,
          ),
          buildSearch(context),
          SizedBox(
            height: 20,
          ),
          buildSavePlate(context),
          SizedBox(
            height: 20,
          ),
          typeListImage ? buildList(context) : buildGrid(context),
        ]),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.extension))
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return Text.rich(TextSpan(
        text: "Welcome ,",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Charlie",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          )
        ]));
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
        child: GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: 2,
      children: [
        ...list.map((e) {
          return Container(
            height: 300,
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

  buildList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...list.map((e) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(e),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }

  buildSavePlate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Save Places",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    typeListImage = true;
                  });
                },
                child: Text("List")),
            TextButton(
                onPressed: () {
                  setState(() {
                    typeListImage = false;
                  });
                },
                child: Text("Grid")),
          ],
        )
      ],
    );
  }
}
