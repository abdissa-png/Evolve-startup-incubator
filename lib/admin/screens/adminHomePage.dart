import 'package:flutter/material.dart';
import 'package:startupincubator/createPost.dart';
import 'package:startupincubator/viewComplaints.dart';
import 'createPostModel.dart';
import 'removeuser.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Post> posts = [
    Post(message: 'message'),
    Post(message: 'message'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: AppBar(
              title: const Text("Hello,Admin"),
              actions: const [
                Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.login,
                      size: 30.0,
                    ))
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.remove,
                  size: 50,
                ),
                title: const Text('Remove Users'),
                onTap: () {
                  // Handle drawer item tap
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RemoveUser()));
                  // Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.create,
                  size: 40,
                ),
                title: const Text('Create Post'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreatePost()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.view_agenda,
                ),
                title: const Text('Complaints'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Complaints()));
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white10,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Your Posts",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: "poppins"),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      width: 390,
                      height: 147,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Text("Message"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 390,
                    height: 147,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: const Text(
                          'Message',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 390,
                    height: 147,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: const Text(
                          'Message',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
