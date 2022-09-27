import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasp_spbume/models/data.dart';
import 'package:rasp_spbume/ui/uikit/subject_card.dart';
import 'package:rasp_spbume/utils/apptypography/typography.dart';
import 'package:rasp_spbume/utils/color_palette/colors.dart';

class DayCard extends StatelessWidget {
  const DayCard({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(daySelector(day.day!),style: AppTypography.mainStyle.copyWith(
              fontSize: 23.w,
              fontWeight: FontWeight.w800,
              color: AppColors.white
          ),),
          SizedBox(height: 2.5.h,),
          for(int i=0;i<day.subjects!.length;i++)SubjectCard(subject: day.subjects![i],)
        ],
      ),
    );
  }
}

String daySelector(int day) {
  switch (day) {
    case 1:
      return "Понедельник";
    case 2:
      return "Вторник";
    case 3:
      return "Среда";
    case 4:
      return "Четверг";
    case 5:
      return "Пятница";
    case 6:
      return "Суббота";
    case 7:
      return "Воскресенье";
    default:
      return "";
  }
}
