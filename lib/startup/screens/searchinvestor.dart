import 'package:flutter/material.dart';

void main() {
  runApp(SearchInvestorApp());
}

class SearchInvestorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Investor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchInvestorScreen(),
    );
  }
}

class SearchInvestorScreen extends StatefulWidget {
  @override
  _SearchInvestorScreenState createState() => _SearchInvestorScreenState();
}

class _SearchInvestorScreenState extends State<SearchInvestorScreen> {
  List<Investor> investors = [
    Investor('John Doe', '123-456-7890'),
    Investor('Jane Smith', '987-654-3210'),
    Investor('Mike Johnson', '555-555-5555'),
  ];

  List<Investor> searchResults = [];

  void searchInvestors(String query) {
    setState(() {
      searchResults = investors
          .where((investor) =>
              investor.name.toLowerCase().contains(query.toLowerCase()))
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
                  title: Text(searchResults[index].name),
                  subtitle: Text('Phone Number: ${searchResults[index].phoneNumber}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Investor {
  final String name;
  final String phoneNumber;

  Investor(this.name, this.phoneNumber);
}


