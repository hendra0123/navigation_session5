import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _isHovered1 = false;
  bool _isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered1 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered1 = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isHovered1 ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    try {
                      Navigator.pushNamed(context, '/fourth_screen');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Terjadi kesalahan: $e'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Go to Fourth Screen',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered2 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered2 = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 250,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isHovered2 ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    try {
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Terjadi kesalahan: $e'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Return to The Previous Screen',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
