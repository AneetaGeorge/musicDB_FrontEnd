import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isDark = true;
  final TextEditingController _controller = TextEditingController();

  void search(String keyword) {
    Navigator.pushNamed(context, '/search-result', arguments: keyword);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return Scaffold(
            appBar: AppBar(title: const Text('Welcome to MusicDB!')),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                // child: SearchAnchor(
                //   builder: (BuildContext context, SearchController controller) {
                child: Center(
                  child: SearchBar(
                    hintText: 'Search song or artist',
                    controller: _controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)
                    ),
                    onSubmitted: (String value) {
                      search(value);
                    },
                    leading: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          search(_controller.text);
                        },
                    ),
                    trailing:
                    <Widget>[
                      IconButton (
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
                    )
                      //TODO: Add the theme icon to the app bar
                      /*Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          isSelected: isDark,
                          onPressed: () {
                            setState(() {
                              isDark = !isDark;
                              print('Changing state of isDark to $isDark');
                            }
                            );
                          },
                          icon: const Icon(Icons.wb_sunny_outlined),
                          selectedIcon: const Icon(Icons.brightness_2_outlined),
                        ),
                      )*/
                    ],
                  ),
                )
            )
        );
  }
}
