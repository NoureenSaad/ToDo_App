import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/app_colors.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selectedDate= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14,left: 5),
          child: EasyInfiniteDateTimeLine(
            firstDate: DateTime.now(),
            focusDate: selectedDate,
            lastDate: DateTime.now().add(Duration(days: 365)),
            dayProps: EasyDayProps(
              inactiveDayStyle: DayStyle(
                borderRadius: 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                dayNumStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                monthStrStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
                dayStrStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
              ),
              activeDayStyle: DayStyle(
                dayNumStyle: TextStyle(
                  color: AppColors.primaryLightColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                monthStrStyle: TextStyle(
                    color: AppColors.primaryLightColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
                dayStrStyle: TextStyle(
                    color: AppColors.primaryLightColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                )
              ),
            ),
            showTimelineHeader: false,
            onDateChange: (newSelectedDate){
              setState(() {
                selectedDate = newSelectedDate;
              });
            },
          ),
        )
      ],
    );
  }
}
