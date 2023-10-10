import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:provider/provider.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../state/providers/auth_provider.dart';
import '../../shared/bottom_navbar_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{"username": '', "password": ''};
  bool _passwordVisible = false;
  bool _loginFailed = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: 'Waiting...',
      progressWidget: const CircularProgressIndicator(),
    );

    try {
      progressDialog.show();

      await authProvider.login(
        username: _formData['username'].trim(),
        password: _formData['password'].trim(),
      );

      if (mounted) {
        progressDialog.hide();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const BottomNavBar();
            },
          ),
          (Route<dynamic> route) => false,
        );
      }
    } catch (error) {
      setState(() {
        _loginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    void loginWrapper(BuildContext context) {
      _login(context);
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: white,
                child: Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(120)),
                    color: priBlue,
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/logo.png"),
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ),
                ),
              ),
              Container(
                color: priBlue,
                child: Container(
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 50),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 80,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              buildUsernameField(),
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0.2,
                                      blurRadius: 0.2,
                                    ),
                                  ],
                                ),
                              ),
                              buildPasswordField(),
                            ],
                          ),
                        ),
                        if (_loginFailed)
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: const Text(
                              'Sai mật khẩu hoặc tên đăng nhập.',
                              style: TextStyle(
                                color: red,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            loginWrapper(context);
                            //showCheckInFailedDialog(context, 'ii');
                          },

                          // onTap: () {
                          //   Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (BuildContext context) {
                          //         return const BottomNavBar();
                          //       },
                          //     ),
                          //     (Route<dynamic> route) => false,
                          //   );
                          // },
                          child: Container(
                            width: 500,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  priBlue,
                                  seatColor,
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "ĐĂNG NHẬP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildPasswordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: _formData['password'],
        validator: (value) {
          if (value!.length < 8) {
            return "Số kí tự phải lớn hơn 8";
          }
          return null;
        },
        onTap: () {
          setState(() {
            _loginFailed = false;
          });
        },
        onSaved: (value) {
          _formData['password'] = value!;
        },
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          border: InputBorder.none,
          hintText: 'password',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Container buildUsernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: _formData['username'],
        validator: (value) {
          if (value!.length < 4) {
            return "Tên đăng nhập phải lớn hơn 6 kí tự";
          }
          return null;
        },
        onTap: () {
          setState(() {
            _loginFailed = false;
          });
        },
        onSaved: (value) {
          _formData['username'] = value!;
        },
        obscureText: false,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          border: InputBorder.none,
          hintText: 'username',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class Dio {}
