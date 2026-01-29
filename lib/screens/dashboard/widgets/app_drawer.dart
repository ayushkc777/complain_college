import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/colors.dart';

class AppDrawer extends StatelessWidget {
  final ValueChanged<int> onSelect;

  const AppDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 3.4.h,
                    backgroundColor: Colors.white,
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
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "C35A • Student",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            _drawerItem(
              icon: Icons.dashboard_outlined,
              label: "Dashboard",
              onTap: () => onSelect(0),
            ),
            _drawerItem(
              icon: Icons.list_alt_outlined,
              label: "My Complaints",
              onTap: () => onSelect(1),
            ),
            _drawerItem(
              icon: Icons.add_circle_outline,
              label: "Submit Complaint",
              onTap: () {},
            ),
            _drawerItem(
              icon: Icons.settings_outlined,
              label: "Settings",
              onTap: () {},
            ),
            _drawerItem(
              icon: Icons.help_outline,
              label: "Help & Support",
              onTap: () {},
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                children: [
                  _drawerItem(
                    icon: Icons.logout,
                    label: "Logout",
                    onTap: () {},
                  ),
                  SizedBox(height: 1.5.h),
                  Text(
                    "v1.0 • Softwarica",
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryBlue),
      title: Text(
        label,
        style: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.w600,
          fontSize: 15.sp,
        ),
      ),
      onTap: onTap,
    );
  }
}
