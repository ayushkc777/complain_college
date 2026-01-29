import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/colors.dart';
import '../../utils/hive_service.dart';
import 'login_screen.dart';
import '../dashboard/dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  // Screen design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 7.h),

            // Title
            Text(
              "Create Account",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 1.h),

            Text(
              "Register to get started",
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 4.h),

            // Full Name
            Text(
              "Full Name",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            _inputField(nameController, "Enter your full name"),

            SizedBox(height: 3.h),

            // Email
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            _inputField(emailController, "Enter your email"),

            SizedBox(height: 3.h),

            // Password
            Text(
              "Password",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            _inputField(passController, "Enter password", obscure: true),

            SizedBox(height: 3.h),

            // Confirm Password
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            _inputField(confirmPassController, "Re-enter password", obscure: true),

            SizedBox(height: 5.h),

            // Register button
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
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final pass = passController.text;
                  final confirm = confirmPassController.text;

                  if (name.isEmpty || email.isEmpty || pass.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill in all fields"),
                      ),
                    );
                    return;
                  }
                  if (pass != confirm) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Passwords do not match"),
                      ),
                    );
                    return;
                  }
                  if (HiveService.userExists(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account already exists. Please login."),
                      ),
                    );
                    return;
                  }

                  await HiveService.saveUser(
                    name: name,
                    email: email,
                    password: pass,
                  );
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
                  "Register",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 2.h),

            // Login redirect
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  // Input field design
  Widget _inputField(TextEditingController controller, String hint,
      {bool obscure = false}) {
    return Container(
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
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
