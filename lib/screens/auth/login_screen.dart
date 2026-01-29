import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/colors.dart';
import '../../utils/hive_service.dart';
import 'register_screen.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  // Screen design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 8.h),

            // Title
            Text(
              "Welcome Back",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 1.h),

            Text(
              "Login to continue",
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 5.h),

            // Email field
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your email",
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // Password field
            Text(
              "Password",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your password",
                ),
              ),
            ),

            SizedBox(height: 5.h),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () async {
                  final email = emailController.text.trim();
                  final pass = passwordController.text;

                  if (email.isEmpty || pass.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter email and password"),
                      ),
                    );
                    return;
                  }
                  if (!_isValidEmail(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid email"),
                      ),
                    );
                    return;
                  }

                  final user = HiveService.getUser(email);
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account not found. Please register."),
                      ),
                    );
                    return;
                  }

                  if ((user['password'] ?? '') != pass) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid password"),
                      ),
                    );
                    return;
                  }

                  await HiveService.setCurrentUser(email);
                  if (!context.mounted) return;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 2.h),

            // Register link
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  "Don’t have an account? Register",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
