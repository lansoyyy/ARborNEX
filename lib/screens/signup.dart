import 'package:flutter/material.dart';
import 'package:landscape/screens/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 20),
                // Register Header
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create a new account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 30),
                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.green),
                          filled: true,
                          fillColor: Colors.green.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Password Input
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.green),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.green.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Confirm Password Input
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.green),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.green.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Terms & Conditions Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _agreeToTerms = !_agreeToTerms;
                                });
                              },
                              child: GestureDetector(
                                onTap: () {
                                  // Use direct navigation to login screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text.rich(
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: TextStyle(color: Colors.grey),
                                    children: [
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Create Account Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _agreeToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Account created successfully')),
                            );
                            // Add sign-up logic here
                          } else if (!_agreeToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'You must agree to the terms and conditions'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green.shade700,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Create account'),
                      ),
                      const SizedBox(height: 16),
                      // Or Sign Up With Section
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Or sign up with'),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Social Login Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.g_mobiledata,
                                size: 40, color: Colors.green),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Google Sign-Up Coming Soon!')),
                              );
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: const Icon(Icons.facebook,
                                size: 40, color: Colors.blue),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Facebook Sign-Up Coming Soon!')));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Redirect to Sign-In
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
