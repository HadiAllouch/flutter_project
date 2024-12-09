import 'package:flutter/material.dart';
import '../models/training_plan_model.dart';
import '../training_plan_detail_page.dart';

class TrainingPlanItem extends StatelessWidget {
  final TrainingPlanModel trainingPlan;

  const TrainingPlanItem({Key? key, required this.trainingPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(
          trainingPlan.imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(trainingPlan.title),
        subtitle: Text(trainingPlan.description),
        trailing: Text(trainingPlan.duration),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TrainingPlanDetailPage(trainingPlan: trainingPlan),
            ),
          );
        },
      ),
    );
  }
}
