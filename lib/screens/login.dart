import 'package:flutter/material.dart';
import 'package:landscape/screens/main_screen.dart';
import 'package:landscape/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/arbornex_logo.png'), // Replace with your asset
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Header Section
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
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
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email Address',
        prefixIcon: const Icon(Icons.email, color: Colors.green),
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
            Checkbox(
              value: _rememberMe,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
            const Text('Remember me'),
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
              decoration: TextDecoration.underline,
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
                    MainScreen()), // Replace with actual home screen
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
                  SignUpScreen()), // Replace with actual SignUpScreen
        );
      },
      child: const Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
