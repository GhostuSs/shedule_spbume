import 'package:flutter/material.dart';
import 'package:rasp_spbume/models/data.dart';
import 'package:rasp_spbume/utils/apptypography/typography.dart';
import 'package:rasp_spbume/utils/color_palette/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({Key? key, required this.subject}) : super(key: key);
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: AppColors.gray, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject.num.toString(),
                  style: AppTypography.mainStyle.copyWith(
                    fontSize: 16.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200.w,
                  child: Text(subject.name!,
                    style: AppTypography.mainStyle.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 15.w,),),
                ),
                Text(subject.type!,style: AppTypography.mainStyle.copyWith(
                    fontSize: 14.w
                ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${subject.startTime!} - ${subject.endTime!}',
                    style: AppTypography.mainStyle
                        .copyWith(fontSize: 15.w, fontWeight: FontWeight.w600),
                  ),
                  Text("ауд. "+subject.auditory!,style: AppTypography.mainStyle.copyWith(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
