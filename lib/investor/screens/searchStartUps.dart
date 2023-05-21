import 'package:flutter/material.dart';

class SearchStartups extends StatefulWidget {
  const SearchStartups({super.key});

  @override
  State<SearchStartups> createState() => _SearchStartupsState();
}

class _SearchStartupsState extends State<SearchStartups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Startups',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter Startup Name',
                labelStyle: TextStyle(color: Color.fromARGB(90, 117, 117, 117)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('startup matching search')],
          ),
          Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ExpansionTile(
                  title: Column(
                    children: [
                      Text(
                        'StartUp Name',
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
