import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  MySlider({super.key});

  final List<String> list = [
    "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1583417319070-4a69db38a482?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  ];
  final List<Course> listCourse = [
    Course("Thuc tap viet nien luan", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Course("Flutter", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1583417319070-4a69db38a482?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Course("Kiem dinh phan mem", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Course("Mau thiet ke", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Course("Java nang cao", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1583417319070-4a69db38a482?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Course("Quan tri du an", "2021-2022 TIN0323223",
        "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complicated image slider demo"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [buildRow(context), buildListCourse(context)],
        ),
      )),
    );
  }

  buildRow(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
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
            })
          ],
        ),
      ),
    );
  }

  BuildListImage(BuildContext context) {
    return Column(
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
            child: Text("Hello"),
          );
        })
      ],
    );
  }

  buildListCourse(BuildContext context) {
    return Column(
      children: [
        ...listCourse.map((e) {
          return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(16),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(e.src),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Title(
                          color: Colors.white,
                          child: Text(
                            e.name,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                          child: Text(e.ma,
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                  Row(
                    children: [
                      Text("10 hoc vien",
                          style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ));
        })
      ],
    );
  }
}

class Course {
  String name;
  String ma;
  String src;

  Course(this.name, this.ma, this.src);
}
