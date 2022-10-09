import 'package:flutter/material.dart';
import 'auth/google_sign_in.dart';
import 'location.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              GoogleSignInProvider(
                context: context,
              ).googleLogin().then(
                    (value) => {
                      if (value == 'Success')
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LocationApp(),
                            ),
                          )
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value),
                            ),
                          )
                        }
                    },
                  );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://blog.hubspot.com/hubfs/image8-2.jpg',
                  height: 50,
                  width: 50,
                ),
                const Text('SignIn With Google'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
