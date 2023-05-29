import 'package:flutter/material.dart';

import '../models/pairedupstartupmodel.dart';

class PairedupStartupsWidget extends StatefulWidget {
  const PairedupStartupsWidget({Key? key}) : super(key: key);

  @override
  _PairedupStartupsWidgetState createState() => _PairedupStartupsWidgetState();
}

class _PairedupStartupsWidgetState extends State<PairedupStartupsWidget> {
  late PairedupStartupsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => PairedupStartupsModel());
  // }

  // @override
  // void dispose() {
  //   _model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }
  List<String> startups = ['StartUp - 1','StartUp - 2','StartUp - 3','StartUp - 4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            // context.pop();
          },
        ),
        title: Text(
          'Paired Startups',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: startups.length,
                itemBuilder: (BuildContext context, int index){
                 return  ListTile(
                    title: Text(
                      startups[index].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    tileColor: Colors.white,
                    dense: false,
                  );
                },
               
              ),
            ],
          ),
        ),
      ),
    );
  }
}
