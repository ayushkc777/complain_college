import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(   // <-- FIXED HERE
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "College Complaint",
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CircleAvatar(
                    radius: 2.4.h,
                    backgroundColor: Colors.blue.shade50,
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),

              // Greeting
              Text(
                "Hello Ayush 👋",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 0.6.h),
              Text(
                "Track, report and resolve college complaints easily.",
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 2.5.h),

              // Summary card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(2.4.h),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Complaint\nSummary",
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 0.8.h),
                          Text(
                            "View status and details of your submitted complaints.",
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Image.asset(
                      "assets/images/homescreen.png",
                      height: 13.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.8.h),

              // Quick categories
              Text(
                "Quick Categories",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickCategory(
                    icon: Icons.chair_alt_outlined,
                    label: "Infrastructure",
                    color: Colors.indigo,
                  ),
                  _quickCategory(
                    icon: Icons.wifi_outlined,
                    label: "Technical",
                    color: Colors.blue,
                  ),
                  _quickCategory(
                    icon: Icons.cleaning_services_outlined,
                    label: "Hygiene",
                    color: Colors.green,
                  ),
                  _quickCategory(
                    icon: Icons.school_outlined,
                    label: "Academic",
                    color: Colors.deepPurple,
                  ),
                ],
              ),

              SizedBox(height: 3.h),

              // Complaint overview
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(2.4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complaint Overview",
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    _overviewRow("Total complaints", "6",
                        AppColors.textDark),
                    SizedBox(height: 1.2.h),
                    _overviewRow("Solved", "3", AppColors.accentGreen),
                    SizedBox(height: 1.2.h),
                    _overviewRow("Pending", "3", AppColors.accentRed),

                    SizedBox(height: 1.8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 1.4.h,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryBlue,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.8.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "50% resolved",
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              // Recent complaints
              Text(
                "Recent Complaints",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.6.h),

              _complaintTile(
                title: "Broken chair in classroom",
                category: "Infrastructure",
                badgeText: "Pending",
                badgeColor: AppColors.accentRed,
              ),
              _complaintTile(
                title: "Wi-Fi not working",
                category: "Technical",
                badgeText: "In review",
                badgeColor: AppColors.primaryBlue,
              ),
              _complaintTile(
                title: "Unclean washroom",
                category: "Hygiene",
                badgeText: "Solved",
                badgeColor: AppColors.accentGreen,
              ),

              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.textGrey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: "Complaints",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  // Quick category item
  Widget _quickCategory({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          height: 6.3.h,
          width: 6.3.h,
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
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 0.7.h),
        SizedBox(
          width: 20.w,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textDark.withOpacity(0.95),
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // Complaint overview row
  Widget _overviewRow(String title, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: 14.5.sp,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Complaint tile
  Widget _complaintTile({
    required String title,
    required String category,
    required String badgeText,
    required Color badgeColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.6.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
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
          // Icon box
          Container(
            height: 4.8.h,
            width: 4.8.h,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.report_problem_outlined,
                color: AppColors.primaryBlue),
          ),
          SizedBox(width: 3.5.w),

          // Title + category
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.4.h),

                Row(
                  children: [
                    Container(
                      height: 1.2.h,
                      width: 1.2.h,
                      decoration: BoxDecoration(
                        color: _getCategoryColor(category),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      category,
                      style: TextStyle(
                        color: AppColors.textDark.withOpacity(0.85),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: badgeColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Category colors
  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case "infrastructure":
        return Colors.blue;
      case "technical":
        return Colors.indigo;
      case "hygiene":
        return Colors.green;
      case "academic":
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }
}