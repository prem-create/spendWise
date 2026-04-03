import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.curve),
          color: Colors.black,
        ),
        margin: EdgeInsets.all(AppSpacing.sm),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: SvgPicture.asset(
            'assets/images/app_logo.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text('SpendWise'),
      titleSpacing: AppSpacing.xs,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.sm),
          child: Stack(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Image.asset('assets/images/user_image.jpg'),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7,
                  child: CircleAvatar(backgroundColor: Colors.green, radius: 5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
