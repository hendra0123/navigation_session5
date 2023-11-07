import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: AnimatedContainer(
            duration:
                Duration(milliseconds: 200), // Durasi animasi dalam milidetik
            width: 180,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isHovered ? Colors.orange : Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                try {
                  Navigator.pushNamed(context, '/second_screen',
                      arguments: 'Ini data yang dikirim dari First Screen');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terjadi kesalahan: $e'),
                    ),
                  );
                }
              },
              child: Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Third',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Fourth',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Dynamic',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/second_screen');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/third_screen');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/fourth_screen');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/dynamic_screen');
          }
        },
      ),
    );
  }
}
