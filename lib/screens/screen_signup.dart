import 'package:flutter/material.dart';
import 'package:myapp/providers/checkboxprovider.dart';
import 'package:myapp/providers/show.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: Color(0xa75db097)),
            onPressed: () {},
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xff5db075),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<ShowProvider>(builder: (context, provider, _) {
                  return TextField(
                    obscureText:! provider.isShowed,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      suffixIcon: TextButton(
                        onPressed: provider.isPasswordShowed,
                        child: Text(
                          provider.isShowed ? 'Hide' : 'Show',
                          style: const TextStyle(color: Color(0xff4caf50)),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Consumer<CheckboxProvider>(builder: (context, provider, _) {
                    return Checkbox(
                        value: provider.isChecked,
                        onChanged: (bool? value) {
                          provider.changeCheck(value);
                        });
                  }),
                  const Expanded(
                    child: Text(
                      'I would like to receive your newsletter and other promotional information.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9e9e9e)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 43),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0xff4caf50)),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4caf50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
