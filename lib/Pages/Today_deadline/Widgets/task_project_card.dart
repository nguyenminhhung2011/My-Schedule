import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/check_container.dart';

class TaskProjectCard extends StatelessWidget {
  const TaskProjectCard({
    Key? key,
    required this.mainTitle,
    required this.title,
    required this.members,
    required this.time,
    required this.percent,
    required this.type,
    required this.press,
  }) : super(key: key);
  final String mainTitle;
  final String title;
  final int members;
  final DateTime time;
  final double percent;
  final int type;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: press,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10.0),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  mainTitle,
                  style: const TextStyle(
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.people,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 280,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: AppColors.primaryColor,
                          size: 15,
                        ),
                        RichText(
                            text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(
                              text: ' No Members: ',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            TextSpan(
                              text: '$members ',
                              style:
                                  const TextStyle(color: AppColors.textColor),
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularPercentIndicator(
                        center: Image.asset(percent < 1
                            ? 'assets/images/app_icon.png'
                            : 'assets/images/app_icon1.png'),
                        animation: true,
                        animationDuration: 600,
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 30,
                        lineWidth: 3.0,
                        percent: 0.6,
                        backgroundColor:
                            // AppColors.primaryColor.withOpacity(0.1),
                            (percent < 1)
                                ? Colors.yellow.withOpacity(0.4)
                                : AppColors.primaryColor.withOpacity(0.1),
                        progressColor: (percent < 1)
                            ? Colors.yellow
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.timelapse_outlined,
                    color: Colors.red[400], size: 18),
                Text(
                  ' ${DateFormat().add_jm().format(time)}',
                  style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                CheckContainer(type: type),
              ],
            )
          ],
        ),
      ),
    );
  }
}
