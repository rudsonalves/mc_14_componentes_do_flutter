import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TinderPage extends StatefulWidget {
  const TinderPage({super.key});

  @override
  State<TinderPage> createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  _toPageHome() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _toPageHome,
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Image.asset('assets/images/tinder.png'),
                    ),
                    Text(
                      'tinder',
                      style: TextStyle(
                        fontSize: 54,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'By tapping Create Account or Sign In, you agree to our ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = _toPageHome,
                    ),
                    TextSpan(text: '. Learn how we process your data in our '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = _toPageHome,
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Cookies Policy',
                      style: TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = _toPageHome,
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TinderButton(
                iconData: Icons.apple_rounded,
                onPressed: _toPageHome,
                label: 'sign in with apple',
              ),
              TinderButton(
                iconData: Icons.facebook_rounded,
                onPressed: _toPageHome,
                label: 'sign in with facebook',
              ),
              TinderButton(
                iconData: Icons.message_rounded,
                onPressed: _toPageHome,
                label: 'sign in with phone number',
              ),
              TextButton(
                onPressed: _toPageHome,
                child: Text(
                  'Trouble Signing In?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TinderButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Color color;
  final IconData iconData;

  const TinderButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = Colors.white,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(color: color, width: 2)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData, size: 28, color: color),
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: TextStyle(color: color, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
