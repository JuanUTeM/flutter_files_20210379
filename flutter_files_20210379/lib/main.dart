import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomTaskList(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomTaskList extends StatefulWidget {
  const CustomTaskList({Key? key}) : super(key: key);

  @override
  _CustomTaskListState createState() => _CustomTaskListState();
}

class _CustomTaskListState extends State<CustomTaskList> {
  bool _isCheckedWork = false;
  bool _isCheckedPersonal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BROWSE'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.palette),
                  title: Text('Art Gallery'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Music Library'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.local_movies),
                  title: Text('Movie Collection'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text('Food Recipes'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.sports_soccer),
                  title: Text('Sports Highlights'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Work'),
                  value: _isCheckedWork,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedWork = value!;
                      if (_isCheckedWork && _isCheckedPersonal) {
                        _isCheckedPersonal = false;
                      }
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Personal'),
                  value: _isCheckedPersonal,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedPersonal = value!;
                      if (_isCheckedPersonal && _isCheckedWork) {
                        _isCheckedWork = false;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomSearchTextField(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Connections',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Discover',
                ),
              ],
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey,
              currentIndex: 0,
              onTap: (index) {
                // Maneja la navegación entre las categorías aquí si es necesario
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Search here');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      color: Colors.grey[300],
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
