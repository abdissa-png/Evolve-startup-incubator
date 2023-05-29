import 'package:flutter/material.dart';

class SearchStartups extends StatefulWidget {
  const SearchStartups({super.key});

  @override
  State<SearchStartups> createState() => _SearchStartupsState();
}

final TextEditingController _searchController = new TextEditingController();
@override

List<String> startups = ['startup 1', 'startUp 2'];
String searchTerm = '';



class _SearchStartupsState extends State<SearchStartups> {
  void initState() {
  super.initState();
  _searchController.addListener(_onSearchChanged);
}
@override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
void _onSearchChanged() {
  String searchTerm = _searchController.text.toString();
  print(searchTerm);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Startups',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                
                decoration: InputDecoration(
                  labelText: 'Enter Startup Name',
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(90, 117, 117, 117)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('startup matching search', style: TextStyle( fontSize:17),),
              )],
            ),
            SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: startups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      title: Column(
                        children: [
                          Text(
                            startups[index].toString(),
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Address'), Text('Addis ababa')],
                          )
                        ],
                      ),
                      initiallyExpanded: false,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Hello world',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Industrial Stage',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                Text(
                                  'Growth ',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Assistance Required',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                Text(
                                  'Financial',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                Text(
                                  'legal',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Request to work with you'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 3.0,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
