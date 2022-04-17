import 'package:flutter/material.dart';
import 'package:hunger_zero/widgets/resetPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignup = false;
  bool _passwordObscured = true;
  bool _confirmPasswordObscured = true;
  bool _forgotPasswordClicked = true;
  String error = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void handleResetPasswordChange(bool value) {
    setState(() {
      _forgotPasswordClicked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Zero Hunger',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: MediaQuery.of(context).size.width * .1),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _forgotPasswordClicked
                      ? Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'invalid input';
                                    }
                                    return null;
                                  },
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    fillColor:
                                        Color.fromARGB(255, 243, 240, 240),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.email),
                                    contentPadding: const EdgeInsets.all(8),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    labelText: 'Email',
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
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
                                    fillColor:
                                        Color.fromARGB(255, 243, 240, 240),
                                    filled: true,
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
                                    prefixIcon: const Icon(Icons.lock),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                              _isSignup == true
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'invalid input';
                                          }
                                          return null;
                                        },
                                        controller: _confirmPasswordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          fillColor: Color.fromARGB(
                                              255, 243, 240, 240),
                                          filled: true,
                                          suffixIcon: IconButton(
                                            icon: _confirmPasswordObscured
                                                ? const Icon(Icons.visibility)
                                                : const Icon(
                                                    Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _confirmPasswordObscured
                                                    ? _confirmPasswordObscured =
                                                        false
                                                    : _confirmPasswordObscured =
                                                        true;
                                              });
                                            },
                                          ),
                                          prefixIcon: const Icon(Icons.lock),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ),
                                          labelText: 'Confirm Password',
                                        ),
                                      ),
                                    )
                                  : Container(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _forgotPasswordClicked
                                        ? handleResetPasswordChange(false)
                                        : handleResetPasswordChange(true);
                                  });
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 25,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('validated');
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isSignup == true
                                        ? _isSignup = false
                                        : _isSignup = true;
                                  });
                                },
                                child: const Text(
                                  'SGINUP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ResetPassword(
                          changePassword: handleResetPasswordChange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
