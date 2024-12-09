class CategoryModel {
  final String name;
  final String iconPath;
  final String boxPicture;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxPicture,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        name: 'FULL BODY',
        iconPath: 'assets/icons/body.png',
        boxPicture: 'assets/images/Body.png',
      ),
      CategoryModel(
        name: 'ARMS',
        iconPath: 'assets/icons/muscle.png',
        boxPicture: 'assets/images/Muscle.png',
      ),
      CategoryModel(
        name: 'ABS',
        iconPath: 'assets/icons/abs.png',
        boxPicture: 'assets/images/ABS.png',
      ),
      CategoryModel(
        name: 'LEGS',
        iconPath: 'assets/icons/leg.png',
        boxPicture: 'assets/images/Legs.png',
      ),
      CategoryModel(
        name: 'GLUTES',
        iconPath: 'assets/icons/squats.png',
        boxPicture: 'assets/images/squats.png',
      ),
      CategoryModel(
        name: 'CHEST',
        iconPath: 'assets/icons/body.png',
        boxPicture: 'assets/images/Body.png',
      ),
      CategoryModel(
        name: 'BACK',
        iconPath: 'assets/icons/back.png',
        boxPicture: 'assets/images/Back.png',
      ),
      CategoryModel(
        name: 'SHOULDERS',
        iconPath: 'assets/icons/shoulder.png',
        boxPicture: 'assets/images/Shoulders.png',
      ),
    ];
  }
}
