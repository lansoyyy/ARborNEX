import 'package:flutter/material.dart';
import 'package:landscape/screens/landscaper_screens/landscaper_home.dart';
import 'package:landscape/screens/landscaper_screens/landscaper_signup.dart';

class LandScaperLoginScreen extends StatefulWidget {
  const LandScaperLoginScreen({super.key});

  @override
  _LandScaperLoginScreenState createState() => _LandScaperLoginScreenState();
}

class _LandScaperLoginScreenState extends State<LandScaperLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.8, // Adjust the opacity value as needed

              child: Image.asset(
                'assets/images/new/image (2).png',
                height: 309,
              ),
            ),

            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/new/image 11.png',
                    height: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        // Header Section
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Login to your Account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email Input
                    _buildEmailInput(),
                    const SizedBox(height: 16),
                    // Password Input
                    _buildPasswordInput(),
                    const SizedBox(height: 16),
                    // Remember Me & Forgot Password
                    _buildRememberMeAndForgotPassword(),
                    const SizedBox(height: 24),
                    // Login Button
                    _buildLoginButton(context),
                    const SizedBox(height: 24),
                    // Sign-Up Redirect
                    _buildSignUpRedirect(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email Address',
        prefixIcon:
            const Icon(Icons.alternate_email_rounded, color: Colors.green),
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
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock, color: Colors.green),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
        return null;
      },
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (!_rememberMe) {
                  setState(() {
                    _rememberMe = true;
                  });
                } else {
                  setState(() {
                    _rememberMe = false;
                  });
                }
              },
              icon: Icon(
                _rememberMe ? Icons.check_circle : Icons.circle_outlined,
                color: Colors.green.shade900,
              ),
            ),
            const Row(
              children: [
                Text('Remember me'),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Forgot Password? Coming soon!')),
            );
          },
          child: const Text(
            'Forget your Password?',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logging in...')),
          );
          // Navigate to Home Screen (adjust to your route)
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const LandscaperHome()), // Replace with actual home screen
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade900,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Log in'),
    );
  }

  Widget _buildSignUpRedirect(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const LandScaperSignUpScreen()), // Replace with actual SignUpScreen
        );
      },
      child: Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color: Colors.green.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
