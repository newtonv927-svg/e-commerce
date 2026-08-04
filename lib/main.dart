import 'package:e_commerce/pages/cart.dart';
import 'package:e_commerce/pages/profile.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
void main() {
  runApp(MainScreen());
}

 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "E-Commerce App",
       theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
       home: HomePage(),

     );
   }
}

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favourites'),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    final pages = [HomePage(), FavouritesPage(), CartPage(), ProfilePage()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
              newIndex++;
            });
          },
          backgroundColor: const Color.fromARGB(255, 243, 33, 54),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.from(
            alpha: 0.702,
            red: 0.639,
            green: 0.702,
            blue: 0.651,
          ),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],

      ),
      )
    );

  }
}