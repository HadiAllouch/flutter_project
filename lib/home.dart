import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'models/category_model.dart';
import 'widgets/category_item.dart';
import 'favorites_page.dart';
import 'profile_page.dart';
import 'models/diet_plan_model.dart';
import 'widgets/diet_plan_item.dart';
import 'models/offer_model.dart';
import 'widgets/offer_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  List<DietPlanModel> dietPlans = [];

  List<OfferModel> offers = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _loadDietPlans();
    _loadOffers();
  }

  //  initialize the categories list
  void _loadCategories() {
    categories = CategoryModel.getCategories();
    setState(() {});
  }

  //  initialize the diet plans list
  void _loadDietPlans() {
    dietPlans = DietPlanModel.getDietPlans();
    setState(() {});
  }

  //  initialize the offers list
  void _loadOffers() {
    offers = OfferModel.getOffers();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<Widget> _widgetOptions;

  @override
  Widget build(BuildContext context) {
    _widgetOptions = <Widget>[
      HomeContent(
          categories: categories, dietPlans: dietPlans, offers: offers), // Home
      const FavoritesPage(), // Favorites
      const ProfilePage(), // Profile
    ];

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
            categories.isNotEmpty && dietPlans.isNotEmpty && offers.isNotEmpty
                ? _widgetOptions.elementAt(_selectedIndex) //  selected
                : const Center(
                    child: CircularProgressIndicator()), // Loading indicator
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Active color
        unselectedItemColor: Colors.grey, // Inactive color
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Fitness Core GYM',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/arrow-Left.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<CategoryModel> categories;
  final List<DietPlanModel> dietPlans;
  final List<OfferModel> offers;

  const HomeContent({
    Key? key,
    required this.categories,
    required this.dietPlans,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(context),
          const SizedBox(height: 20),
          const Text(
            'BY BODY PART',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(category: categories[index]);
              },
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'DIET PLAN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150, // Adjusted height for diet plan items
            child: ListView.builder(
              itemCount: dietPlans.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return DietPlanItem(dietPlan: dietPlans[index]);
              },
            ),
          ),
          const SizedBox(height: 30), // Spacing between sections
          const Text(
            'OFFERS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 280, // Adjusted height for offer items
            child: ListView.builder(
              itemCount: offers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OfferItem(offer: offers[index]);
              },
            ),
          ),
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 4,
          spreadRadius: 0.0,
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintText: 'Search abs, cardio, cycling etc..',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 20,
              width: 20,
            ),
          ),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              height: 20,
              width: 20,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Filter action pressed'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
