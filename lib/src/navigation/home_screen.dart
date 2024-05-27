import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        toolbarHeight: 50.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cupid.png', 
              height: 45.0,
            ), // any logo we make, just a placeholder for now
            const Text(
              'Cupid',
            ),
          ],
        ),
      ),
      // profile card and the choice buttons
      body: Column(
        children: [
          DiscoverProfile(),
          CupidButtons(),
        ],
      ),
      // nav bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x00f2ecdc),
        selectedItemColor:  Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 4',
          ),
        ],
      ),
    );
  }
}

class DiscoverProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/catselfie.jpg'),
                ),
              ),
            ),
            const Positioned(
              bottom: 20.0,
              left: 10.0,
              child: Text(
                'Cat, 19',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CupidButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            size: 50,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.send,
            size: 50,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.highlight_off_outlined,
            size: 50,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}