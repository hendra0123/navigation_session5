import 'package:flutter/material.dart';

class DynamicScreen extends StatefulWidget {
  @override
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  TextEditingController _controller = TextEditingController();
  List<int> dynamicRoutes = [];
  bool _isHovered1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Masukkan angka'),
              ),
              SizedBox(height: 20),
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
                        if (_controller.text.isNotEmpty) {
                          int numberOfScreens = int.parse(_controller.text);
                          setState(() {
                            // Membuat list rute berdasarkan input angka
                            dynamicRoutes = List.generate(
                                numberOfScreens, (index) => index + 1);
                          });
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terjadi kesalahan: $e'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Make Another Routes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: dynamicRoutes.length,
                  itemBuilder: (context, index) {
                    int routeNumber = dynamicRoutes[index];
                    return ListTile(
                      title: Text('Route $routeNumber'),
                      onTap: () {
                        // Navigasi ke DynamicDetailScreen dengan ID rute yang dipilih
                        Navigator.pushNamed(
                            context, '/dynamic_screen/$routeNumber');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
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
