import 'package:flutter/material.dart';
import 'otp_verification_page.dart';
import 'account_selection_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isOtpLogin = false; // Tracks whether OTP login is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 182, 118, 255), // Purple background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder logo
                Image.asset(
                  'assets/images/lorryicon.png', // Replace with your logo asset
                  height: 80,
                ),
                const SizedBox(height: 40),

                // Login form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (!isOtpLogin) ...[
                        // Email and Password Login Fields
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (!isOtpLogin && (value == null || value.isEmpty)) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (!isOtpLogin && (value == null || value.isEmpty)) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),

                        // Forgot Password link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle Forgot Password
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ] else ...[
                        // Phone Number Login Field
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (isOtpLogin && (value == null || value.isEmpty)) {
                              return 'Please enter your phone number';
                            }
                            if (isOtpLogin && !RegExp(r'^\d{10}$').hasMatch(value!)) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                      const SizedBox(height: 16),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (isOtpLogin) {
                                // Navigate to OTP Verification Page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpVerificationPage(),
                                  ),
                                );
                              } else {
                                // Handle Email/Password Login
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login Successful!'),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 243, 166, 198),
                          ),
                          child: Text(
                            isOtpLogin ? 'Sign in with Phone Number' : 'Login',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Toggle Between Login Methods
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isOtpLogin = !isOtpLogin;
                          });
                        },
                        child: Text(
                          isOtpLogin
                              ? 'Use Email and Password Login'
                              : 'Use Phone Number Login',
                          style: const TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Register link
                TextButton(
                  onPressed: () {
                    // Navigate to Register Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSelectionPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'New to Cogo? Register',
                    style: TextStyle(color: Colors.blueAccent),
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
