class DietPlanModel {
  final String name;
  final String imagePath;
  bool isFavorite;

  DietPlanModel({
    required this.name,
    required this.imagePath,
    this.isFavorite = false,
  });

  static List<DietPlanModel> getDietPlans() {
    return [
      DietPlanModel(
        name: 'Kale Salad',
        imagePath: 'assets/images/diet_plans/Salad.png',
      ),
      DietPlanModel(
        name: 'Grilled Chicken',
        imagePath: 'assets/images/diet_plans/Grilled.png',
      ),
      DietPlanModel(
        name: 'Quinoa Bowl',
        imagePath: 'assets/images/diet_plans/Quinao-Bowi.png',
      ),
      DietPlanModel(
        name: 'Avocado Toast',
        imagePath: 'assets/images/diet_plans/Avoca-Toast.png',
      ),
    ];
  }
}
