import 'package:flutter/material.dart';

import '../models/searchInvestorModel.dart';

class SearchInvestorScreen extends StatefulWidget {
  @override
  _SearchInvestorScreenState createState() => _SearchInvestorScreenState();
}

class _SearchInvestorScreenState extends State<SearchInvestorScreen> {
  List<searchInvestor> investors = [
    searchInvestor(title: 'John Doe', message: '123-456-7890'),
    searchInvestor(title: 'Jane Smith', message: '987-654-3210'),
    searchInvestor(title: 'Mike Johnson', message: '555-555-5555'),
  ];

  List<searchInvestor> searchResults = [];

  void searchInvestors(String query) {
    setState(() {
      searchResults = investors
          .where((investor) =>
              investor.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 177, 252),
        title: Text('Search Investor'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchInvestors,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter investor name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text('Investors Matching Result'),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].title),
                  subtitle:
                      Text('Phone Number: ${searchResults[index].message}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
