import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key, this.image, this.title, this.onPressed});

  final String? image;
  final String? title;
  final void Function()? onPressed;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26.w),
        child: SizedBox(
          width: 323.w,
          height: 46.h,

          child: ListTile(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),),
            dense: true,
            horizontalTitleGap: 3,
            leading: SvgPicture.asset(widget.image ?? '', color: ColorsManager.pink,),
            title: Text(widget.title ?? '',
                style: Theme.of(context).textTheme.displayMedium),
           /* trailing: SvgPicture.asset(AssetsManager.arrowBackW,
                matchTextDirection: false,
                alignment: AlignmentDirectional.centerEnd),*/
          ),
        ),
      ),
    );
  }
}