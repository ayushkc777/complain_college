import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/colors.dart';

class ComplaintsTab extends StatelessWidget {
  const ComplaintsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Complaints",
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              "Track all submitted complaints in one place.",
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 3.h),
            _statusCard(
              title: "Open Complaints",
              value: "4",
              color: AppColors.primaryBlue,
              icon: Icons.pending_actions,
            ),
            SizedBox(height: 2.h),
            _statusCard(
              title: "Resolved Complaints",
              value: "2",
              color: AppColors.accentGreen,
              icon: Icons.check_circle_outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            height: 5.4.h,
            width: 5.4.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
