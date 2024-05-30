import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: TopBar(),
      // profile card and the choice buttons
      body: Column(
        children: [
          DiscoverProfile(),
          CupidButtons(),
        ],
      ),
      // nav bar
      bottomNavigationBar: NavBar(),
    );
  }
}

class TopBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(35);
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 30.0,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Image.asset(
                  'assets/cupid.png', 
                  height: 25.0,
                ),
                const Text(
                  'Cupid',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ), // any logo we make, just a placeholder for now
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Discover',
                    style: TextStyle(fontSize: 20),
                    ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Friends',
                    style: TextStyle(fontSize: 20),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0x00f2ecdc),
      selectedItemColor:  Colors.redAccent,
      unselectedItemColor: Colors.grey,
      items: const [
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
    );
  }
}

class DiscoverProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/catselfie.jpg'),
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