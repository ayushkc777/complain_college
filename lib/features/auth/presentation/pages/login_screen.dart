import 'package:complain_college/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../data/datasources/auth_local_datasource.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => isLoading = true);
    final auth = AuthLocalDatasource();
    final success = await auth.login(email: email, password: password);
    setState(() => isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  void navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            child: Column(
              children: [
                // Gradient Header
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryBlue, AppColors.primaryBlue.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6))],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.login_rounded, size: 48, color: Colors.white),
                      SizedBox(height: 1.h),
                      Text("Welcome Back!",
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 0.5.h),
                      Text("Sign in to continue",
                          style: TextStyle(fontSize: 16.sp, color: Colors.white70)),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),

                // Form Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.06),
                          blurRadius: 12,
                          offset: Offset(0, 6))
                    ],
                  ),
                  child: Column(
                    children: [
                      _inputField(emailController, "Email Address", icon: Icons.email_outlined),
                      SizedBox(height: 2.h),
                      _inputField(passwordController, "Password", obscure: true, icon: Icons.lock_outline),
                      SizedBox(height: 4.h),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 6.h,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Login", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 2.h),

                      // Register Link
                      TextButton(
                        onPressed: navigateToRegister,
                        child: Text("Don't have an account? Sign Up",
                            style: TextStyle(color: AppColors.primaryBlue, fontSize: 15.sp)),
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

  Widget _inputField(TextEditingController controller, String hint, {bool obscure = false, IconData? icon}) {
    return TextField(
      controller: controller,
      obscureText: obscure ? obscurePassword : false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.primaryBlue),
        hintText: hint,
        filled: true,
        fillColor: AppColors.bgWhite,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: obscure
            ? IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: AppColors.primaryBlue,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        )
            : null,
      ),
    );
  }
}
