import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../data/datasources/auth_local_datasource.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void handleRegister() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirm = confirmController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    setState(() => isLoading = true);
    final auth = AuthLocalDatasource();
    final result = await auth.signUp(email: email, password: password);
    setState(() => isLoading = false);

    if (result == 'Sign up successful') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created! Please login')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
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
                // Header
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
                      Icon(Icons.person_add_rounded, size: 48, color: Colors.white),
                      SizedBox(height: 1.h),
                      Text("Create Account",
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 0.5.h),
                      Text("Register to get started",
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
                      BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 12, offset: Offset(0, 6))
                    ],
                  ),
                  child: Column(
                    children: [
                      _inputField(nameController, "Full Name", icon: Icons.person_outline_rounded),
                      SizedBox(height: 2.h),
                      _inputField(emailController, "Email Address", icon: Icons.email_outlined),
                      SizedBox(height: 2.h),
                      _inputField(passwordController, "Password", obscure: true, icon: Icons.lock_outline_rounded),
                      SizedBox(height: 2.h),
                      _inputField(confirmController, "Confirm Password", obscure: true, icon: Icons.lock_outline_rounded),
                      SizedBox(height: 4.h),

                      // Register Button
                      SizedBox(
                        width: double.infinity,
                        height: 6.h,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : handleRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Register", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 2.h),

                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Already have an account? Login",
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

  Widget _inputField(TextEditingController controller, String hint,
      {bool obscure = false, IconData? icon}) {
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
