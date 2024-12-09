import 'package:flutter/material.dart';
import 'models/category_model.dart';
import 'models/training_plan_model.dart';
import 'widgets/training_plan_item.dart';

class TrainingPlansPage extends StatelessWidget {
  final CategoryModel category;

  const TrainingPlansPage({Key? key, required this.category}) : super(key: key);

  List<TrainingPlanModel> getTrainingPlans() {
    switch (category.name) {
      case 'FULL BODY':
        return [
          TrainingPlanModel(
            title: 'Full Body Blast',
            description:
                'A comprehensive workout targeting all major muscle groups.',
            imagePath: 'assets/images/Body.png',
            duration: '45 mins',
          ),
          TrainingPlanModel(
            title: 'Total Strength',
            description: 'Build overall strength with this full-body regimen.',
            imagePath: 'assets/images/Body.png',
            duration: '60 mins',
          ),
        ];
      case 'ARMS':
        return [
          TrainingPlanModel(
            title: 'Arm Sculpt',
            description:
                'Tone and strengthen your arms with targeted exercises.',
            imagePath: 'assets/images/Muscle.png',
            duration: '30 mins',
          ),
          TrainingPlanModel(
            title: 'Bicep Builder',
            description: 'Increase bicep size and strength effectively.',
            imagePath: 'assets/images/Muscle.png',
            duration: '40 mins',
          ),
        ];
      case 'ABS':
        return [
          TrainingPlanModel(
            title: 'Abs Accelerator',
            description: 'Intensify your core workouts for defined abs.',
            imagePath: 'assets/images/ABS.png',
            duration: '25 mins',
          ),
          TrainingPlanModel(
            title: 'Core Strength',
            description: 'Enhance your core stability and strength.',
            imagePath: 'assets/images/ABS.png',
            duration: '35 mins',
          ),
        ];
      case 'LEGS':
        return [
          TrainingPlanModel(
            title: 'Leg Power',
            description: 'Build powerful legs with this intensive workout.',
            imagePath: 'assets/images/Legs.png',
            duration: '40 mins',
          ),
          TrainingPlanModel(
            title: 'Squat Mastery',
            description: 'Master the squat with proper form and technique.',
            imagePath: 'assets/images/Legs.png',
            duration: '50 mins',
          ),
        ];
      case 'GLUTES':
        return [
          TrainingPlanModel(
            title: 'Glute Gain',
            description: 'Strengthen and tone your glutes effectively.',
            imagePath: 'assets/images/squats.png',
            duration: '35 mins',
          ),
          TrainingPlanModel(
            title: 'Squat Sculpt',
            description: 'Sculpt your glutes with targeted squat variations.',
            imagePath: 'assets/images/squats.png',
            duration: '45 mins',
          ),
        ];
      case 'CHEST':
        return [
          TrainingPlanModel(
            title: 'Chest Chisel',
            description: 'Define and strengthen your chest muscles.',
            imagePath: 'assets/images/Muscle.png',
            duration: '30 mins',
          ),
          TrainingPlanModel(
            title: 'Push-Up Power',
            description:
                'Enhance your push-up form for maximum chest engagement.',
            imagePath: 'assets/images/Muscle.png',
            duration: '40 mins',
          ),
        ];
      case 'BACK':
        return [
          TrainingPlanModel(
            title: 'Back Builder',
            description: 'Develop a strong and muscular back.',
            imagePath: 'assets/images/Back.png',
            duration: '35 mins',
          ),
          TrainingPlanModel(
            title: 'Lat Stretch',
            description: 'Improve your lat flexibility and strength.',
            imagePath: 'assets/images/Back.png',
            duration: '45 mins',
          ),
        ];
      case 'SHOULDERS':
        return [
          TrainingPlanModel(
            title: 'Shoulder Strength',
            description: 'Build strong and defined shoulders.',
            imagePath: 'assets/images/Shoulders.png',
            duration: '30 mins',
          ),
          TrainingPlanModel(
            title: 'Deltoid Development',
            description: 'Target all three heads of the deltoid muscles.',
            imagePath: 'assets/images/Shoulders.png',
            duration: '40 mins',
          ),
        ];

      default:
        return [
          TrainingPlanModel(
            title: 'General Fitness',
            description: 'Maintain your fitness with this balanced workout.',
            imagePath: 'assets/images/Muscle.png',
            duration: '35 mins',
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TrainingPlanModel> trainingPlans = getTrainingPlans();

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} Plans'),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: trainingPlans.length,
        itemBuilder: (context, index) {
          return TrainingPlanItem(trainingPlan: trainingPlans[index]);
        },
      ),
    );
  }
}
