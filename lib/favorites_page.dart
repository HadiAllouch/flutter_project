import 'package:flutter/material.dart';
import 'models/diet_plan_model.dart';
import 'models/offer_model.dart';
import 'widgets/diet_plan_item.dart';
import 'widgets/offer_item.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<DietPlanModel> favoriteDietPlans =
        DietPlanModel.getDietPlans().where((plan) => plan.isFavorite).toList();

    List<OfferModel> favoriteOffers =
        OfferModel.getOffers().where((offer) => offer.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: favoriteDietPlans.isNotEmpty || favoriteOffers.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Favorite Diet Plans Section
                    if (favoriteDietPlans.isNotEmpty) ...[
                      const Text(
                        'Diet Plans',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150, // Adjust height as needed
                        child: ListView.builder(
                          itemCount: favoriteDietPlans.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return DietPlanItem(
                                dietPlan: favoriteDietPlans[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],

                    if (favoriteOffers.isNotEmpty) ...[
                      const Text(
                        'Offers',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          itemCount: favoriteOffers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return OfferItem(offer: favoriteOffers[index]);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              )
            : const Center(
                child: Text(
                  'No favorites yet!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
