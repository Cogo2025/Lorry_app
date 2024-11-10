import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup Animation',
      home: LoginSignupPage(),
    );
  }
}
class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}
class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;
  bool showLoginContent = false;
  double containerHeight = 0; // Height of the animated container
  void toggleView() {
    setState(() {
      isLogin = !isLogin;
    });
  }
  void showContent() {
    setState(() {
      showLoginContent = true;
      containerHeight = 500; // Set height when showing content
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: GestureDetector(
        onTap: () {
          if (!showLoginContent) {
            showContent();
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Cogo',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                if (!showLoginContent) ...[
                  Text(
                    'Tap anywhere to continue',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: showLoginContent ? containerHeight : 0, // Control height
                  curve: Curves.easeInOut,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Toggle Buttons for Login and Signup
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => toggleView(),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isLogin ? Colors.blue : Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isLogin ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => toggleView(),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isLogin ? Colors.white : Colors.blue,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Text(
                                      'Signup',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isLogin ? Colors.black : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: PageTransitionSwitcher(
                              duration: Duration(milliseconds: 400),
                              reverse: !isLogin,
                              transitionBuilder: (child, animation, secondaryAnimation) {
                                return FadeThroughTransition(
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  child: child,
                                );
                              },
                              child: isLogin ? LoginForm() : SignupForm(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login Form',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Forgot password?', style: TextStyle(color: Colors.blue)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Signup Form',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Signup'),
          ),
        ],
      ),
    );
  }
}