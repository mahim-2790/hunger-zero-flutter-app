import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hunger_zero/models/user_model.dart';
import 'package:hunger_zero/server/serverCom.dart';
import 'package:hunger_zero/widgets/loginPage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _organizationNameController = TextEditingController();
  final _nidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordObscured = true;
  bool _confirmPasswordObscured = true;
  late UserModel user;

  void registerUser(BuildContext context) async {
    print('hitter register user');
    var res = await postUser(user);
    print(res);
    if (res['acknowledged']) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(' '),
              content: Text('Registration Sucessfull'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        ),
                    child: Text('login'))
              ],
            );
          });
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneNumberController.clear();
      _organizationNameController.clear();
      _nidController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    } else {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(' '),
              content: Text('Something went wrong'),
              actions: [TextButton(onPressed: () {}, child: Text('Try again'))],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/vecteezy_abstract-water-wave-design-background_6836246.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              right: MediaQuery.of(context).size.width * .05,
              top: MediaQuery.of(context).size.height * .03,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _nidController,
                            decoration: const InputDecoration(
                              labelText: 'NID',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _organizationNameController,
                            decoration: const InputDecoration(
                              labelText: 'Organization Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: _passwordObscured,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: _passwordObscured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordObscured
                                        ? _passwordObscured = false
                                        : _passwordObscured = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'invalid input';
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return 'password does not match';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: _confirmPasswordObscured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordObscured
                                        ? _confirmPasswordObscured = false
                                        : _confirmPasswordObscured = true;
                                  });
                                },
                              ),
                              labelText: 'Confirm Password',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: ElevatedButton(
                            child: const Text(
                              'Apply as volunteer',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  user = UserModel(
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    email: _emailController.text,
                                    phoneNumber: _phoneNumberController.text,
                                    nidNumber: _nidController.text,
                                    organizationName:
                                        _organizationNameController.text,
                                  );
                                });
                                print(user.email);
                                registerUser(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    // );
  }
}
