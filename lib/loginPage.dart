import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passworkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    icon: Icon(Icons.arrow_back)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WrapPassPage()),
                      );
                    },
                    child: Text("Quên mật khẩu?",
                        style: TextStyle(color: Colors.green)))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text("Đăng nhập",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Tên đăng nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Tên đăng nhập",
                        label: Text("Tên đăng nhập"),
                        prefixIcon: Icon(Icons.person)),
                    controller: _userNameController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Mật khẩu nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        label: Text("Mật khẩu"),
                        prefixIcon: Icon(Icons.key)),
                    controller: _passworkController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var snackBar = SnackBar(
                              content: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Text("Xin chao: ${_userNameController.text}")
                            ],
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Đăng nhập")),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text("Đăng ký")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passworkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            Text("Đăng ký",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Email rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.person)),
                    controller: _userNameController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Tên đăng nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Tên đăng nhập",
                        label: Text("Tên đăng nhập"),
                        prefixIcon: Icon(Icons.person)),
                    controller: _userNameController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Mật khẩu nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        label: Text("Mật khẩu"),
                        prefixIcon: Icon(Icons.key)),
                    controller: _passworkController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var snackBar = SnackBar(
                              content: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Text("Bạn đã đăng ký thành công")
                            ],
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Đăng ký")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WrapPassPage extends StatelessWidget {
  WrapPassPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passworkController = TextEditingController();
  final _repassworkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            Text("Đổi mật khẩu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Tên đăng nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Tên đăng nhập",
                        label: Text("Tên đăng nhập"),
                        prefixIcon: Icon(Icons.person)),
                    controller: _userNameController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Mật khẩu nhập rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        label: Text("Mật khẩu"),
                        prefixIcon: Icon(Icons.key)),
                    controller: _passworkController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return "Mật khẩu rỗng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Nhập lai mật khẩu",
                        label: Text("Nhập lai mật khẩu"),
                        prefixIcon: Icon(Icons.key)),
                    controller: _repassworkController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var snackBar = SnackBar(
                              content: Row(
                            children: [Text("Bạn đã đổi mật khẩu thành công")],
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Xác nhận")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
