import 'package:flutter/material.dart';
import 'package:goodmorning/modules/task1/Collection.dart';
import 'package:goodmorning/modules/task1/custom_drawer.dart';
import 'package:goodmorning/modules/task1/myprofile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Color> _gradientColors = [
    const Color.fromARGB(255, 66, 3, 176),
    const Color.fromARGB(46, 17, 2, 77),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daraz'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // Navigate to home
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/myphoto.jpg'),
              radius: 15,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Myprofile(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with category cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryCard(
                      context, 'Shoes', 'assets/images/shoes.jpg'),
                  _buildCategoryCard(
                      context, 'Watches', 'assets/images/watches.jpg'),
                  _buildCategoryCard(context, 'Bags', 'assets/images/bag.jpg'),
                  _buildCategoryCard(
                      context, 'Mobiles', 'assets/images/mobiles.jpg'),
                  _buildCategoryCard(
                      context, 'Laptops', 'assets/images/laptops.jpg'),
                  _buildCategoryCard(
                      context, 'Clothes', 'assets/images/clothes.jpg'),
                ],
              ),
              const SizedBox(height: 20),

              // Centered containers with images and text
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // First row with two containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCustomContainer(),
                        const SizedBox(width: 16), // Space between containers
                        _buildCustomContainer(),
                      ],
                    ),
                    const SizedBox(height: 16), // Space between rows

                    // Second row with two containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCustomContainer(),
                        const SizedBox(width: 16), // Space between containers
                        _buildCustomContainer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 10,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.yellowAccent,
          unselectedItemColor: Colors.white,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }

  // Function to create a category card
  static Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CollectionPage()),
        );
      },
      child: Container(
        width: 110,
        height: 110,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a container with "Hello" text and an image
  Widget _buildCustomContainer() {
    return Container(
      width: 200, // Adjust width
      height: 205, // Adjust height
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 2, 41, 73),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/example1.jpg', // Image source
            width: 180,
            height: 160,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          const Text(
            'Alpha Go  Price:2300 BDT',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 243, 33, 152),
            ),
          ),
        ],
      ),
    );
  }
}
