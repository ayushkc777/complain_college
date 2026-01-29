import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.all(2.4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 3.4.h,
                    backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      color: AppColors.primaryBlue,
                      size: 3.6.h,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aayush KC",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        "aayush@softwarica.edu",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            _profileItem(
              icon: Icons.edit_outlined,
              label: "Edit Profile",
            ),
            _profileItem(
              icon: Icons.lock_outline,
              label: "Change Password",
            ),
            _profileItem(
              icon: Icons.notifications_outlined,
              label: "Notification Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem({required IconData icon, required String label}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primaryBlue),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.sp,
        color: AppColors.textGrey,
      ),
      onTap: () {},
    );
  }
}
