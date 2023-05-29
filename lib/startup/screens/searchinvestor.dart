import 'package:flutter/material.dart';

import '../models/searchInvestorModel.dart';


class searchInvestor {
  final String title;
  final String message;

  searchInvestor({required this.title, required this.message});
}

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
                return ExpansionTile(
                  title: Text(
                    searchResults[index].title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Phone Number: ${searchResults[index].message}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Investment Stage: ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Growth',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Investment Interests: ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Financial',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Check Startup'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Request to Work'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
