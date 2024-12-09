class OfferModel {
  final String title;
  final String description;
  final String imagePath;
  final String duration;
  bool isFavorite;

  OfferModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.duration,
    this.isFavorite = false,
  });

  static List<OfferModel> getOffers() {
    return [
      OfferModel(
        title: 'Daily Subscription',
        description: 'Access to all workouts and diet plans for one day.',
        imagePath: 'assets/images/offers/daily_offer.png',
        duration: 'Daily',
      ),
      OfferModel(
        title: 'Monthly Subscription',
        description: 'Enjoy a month of unlimited access to all features.',
        imagePath: 'assets/images/offers/monthly_offer.png',
        duration: 'Monthly',
      ),
      OfferModel(
        title: 'Yearly Subscription',
        description: 'Get a full year of premium access at a discounted rate.',
        imagePath: 'assets/images/offers/yearly_offer.png',
        duration: 'Yearly',
      ),
    ];
  }
}
