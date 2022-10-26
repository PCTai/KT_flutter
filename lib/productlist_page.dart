import 'package:flutter/material.dart';
import 'package:project_study/product_model.dart';
import 'package:project_study/product_provider.dart';

import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool typeListImage = true;
  Set<ProductModel> listCart = Set();
  List<ProductModel> listProduct = [];

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    Set<String> listCategory = Set();
    productProvider.list.forEach((element) {
      listCategory.add(element.category.toString());
    });
    listProduct.addAll(productProvider.list);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...listCategory
                      .map((e) => TextButton(
                          onPressed: () {
                            setState(() {
                              typeListImage = true;
                              listProduct.clear();
                              productProvider.list.forEach((element) {
                                if (e == element.category) {
                                  listProduct.add(element);
                                }
                              });
                            });
                          },
                          child: Text(e.toUpperCase())))
                      .toList(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSearch(context),
            SizedBox(
              height: 20,
            ),
            buildSavePlate(context, listCart),
            SizedBox(
              height: 20,
            ),
            typeListImage
                ? (Expanded(
                    child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      ...productProvider.list.map((e) {
                        String price = (e.price.toString());

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.network(
                                e.image ?? "",
                                width: 100,
                                height: 150,
                              ),
                              Text(e.title ?? ""),
                              Text("$price"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  productSingle(context, e)),
                                        );
                                      },
                                      child: Text("Details")),
                                  TextButton(
                                      onPressed: () {
                                        listCart.add(e);
                                        var snackBar = SnackBar(
                                            content: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                            Text("Add to cart success")
                                          ],
                                        ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text("add to cart"))
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  )))
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...productProvider.list.map((e) {
                            String price = (e.price.toString());
                            return Container(
                              margin: EdgeInsets.all(10),
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      e.image ?? "",
                                      width: 100,
                                      height: 150,
                                    ),
                                    Text(e.title ?? ""),
                                    Text(price ?? ""),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        productSingle(
                                                            context, e)),
                                              );
                                            },
                                            child: Text("Details")),
                                        TextButton(
                                            onPressed: () {
                                              listCart.add(e);
                                              var snackBar = SnackBar(
                                                  content: Row(
                                                children: [
                                                  Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.white,
                                                  ),
                                                  Text("Add to cart success")
                                                ],
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                            child: Text("add to cart"))
                                      ],
                                    )
                                  ]),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  buildSavePlate(BuildContext context, list) {
    double total = 0;
    listCart.forEach((element) {
      total += double.parse(element.price.toString() ?? '0');
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                    typeListImage = true;
                  });
                },
                child: Text("Grid")),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Text("Total: "),
                Text(
                  total.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cart(context, list)),
                  );
                },
                child: Icon(Icons.shopping_cart)),
          ],
        )
      ],
    );
  }

  productSingle(BuildContext context, product) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          height: 20,
        ),
        Image.network(
          product.image ?? "",
          width: 100,
          height: 150,
        ),
        Text(
          product.title ?? "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Text(product.price.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20)),
        SizedBox(
          height: 50,
        ),
        TextButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: () {
              listCart.add(product);
              var snackBar = SnackBar(
                  content: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text("Add to cart success")
                ],
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text("Add to cart"))
      ],
    );
  }

  cart(BuildContext context, list) {
    double total = 0;
    listCart.forEach((element) {
      total += double.parse(element.price.toString() ?? '0');
    });
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              height: 20,
            ),
            ...list.map((e) {
              String price = (e.price.toString());
              return Container(
                margin: EdgeInsets.all(20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.network(
                    e.image ?? "",
                    width: 30,
                    height: 40,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title ?? "",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        price ?? "",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  )
                ]),
              );
            }).toList(),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Total: ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      total.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: Text("Check out"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
