import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  final Function changePassword;
  const ResetPassword({Key? key, required this.changePassword})
      : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reset your password here',
          style: Theme.of(context).textTheme.headline4,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 243, 240, 240),
              filled: true,
              prefixIcon: const Icon(Icons.verified_user),
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              labelText: 'Email',
            ),
          ),
        ),
        Text(
          'We will send you plain-text password in this account.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
          child: Column(
            children: [
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
                onPressed: () {},
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.changePassword(true);
                },
                child: const Text(
                  'Back',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
