import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    final controller = TextEditingController();
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.light : Brightness.dark);

    return MaterialApp(
        theme: themeData,
        home: Scaffold(
            appBar: AppBar(title: const Text('Search Bar Sample')),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                // child: SearchAnchor(
                //   builder: (BuildContext context, SearchController controller) {
                child: Center(
                  child: SearchBar(
                    hintText: 'Search song or artist',
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)
                    ),
                    onSubmitted: (String value) {
                    },
                    onTap: () {
                      print('Tapped');
                      // controller.openView();
                    },
                    onChanged: (_) {
                    // controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
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
                      )
                    ],
                  ),
                )
              // },
              // suggestionsBuilder: (BuildContext context, SearchController controller) {
              //   return null;
              // }
            )
        )
    );
  }
}
    // );
