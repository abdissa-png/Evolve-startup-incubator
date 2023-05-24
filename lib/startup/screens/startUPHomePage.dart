import 'package:flutter/material.dart';

import '../models/startUphomepagemodel.dart';
export '../models/startUphomepagemodel.dart';

class StartUpHomePageWidget extends StatefulWidget {
  const StartUpHomePageWidget({Key? key}) : super(key: key);

  @override
  _StartUpHomePageWidgetState createState() => _StartUpHomePageWidgetState();
}

class _StartUpHomePageWidgetState extends State<StartUpHomePageWidget> {
  late StartUpHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => StartUpHomePageModel());
  // }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(100, 117, 117, 117),
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
                ListTile(
                  leading: Icon(
                    Icons.content_paste_sharp,
                  ),
                  title: Text(
                    'Startup\'s you paired with',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(100, 117, 117, 117),
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(100, 117, 117, 117),
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                  ),
                  title: Text(
                    'Edit Account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(100, 117, 117, 117),
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
                ListTile(
                  leading: Icon(
                    Icons.message,
                  ),
                  title: Text(
                    'Submit complaint',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(100, 117, 117, 117),
                    size: 20,
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Hello, Investor',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.login_rounded,
                          color: Colors.black,
                          
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      
                    ],
                  ),
                ],
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          labelColor: Colors.blue,
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              text: 'Responses',
                            ),
                            Tab(
                              text: 'Requests',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ListTile(
                                    title: Text(
                                      'investor 1',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'Accepted',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                  ListTile(
                                    title: Text(
                                      'investor 2',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'Accepted',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                  ListTile(
                                    title: Text(
                                      'investor 3',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'Accepted',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ListTile(
                                    title: Text(
                                      'investor 1',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'pending',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                  ListTile(
                                    title: Text(
                                      'investor 2',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'pending',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                  ListTile(
                                    title: Text(
                                      'investor 3',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'pending',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}